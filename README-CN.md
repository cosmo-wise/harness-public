<div align="center">
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset=".github/logo-dark.svg">
    <source media="(prefers-color-scheme: light)" srcset=".github/logo-light.svg">
    <img alt="Harness" src=".github/logo-light.svg" width="480">
  </picture>

  <p>AI 驱动的软件交付编排平台</p>
</div>

<div align="center">
  <a href="#快速开始">快速开始</a> &middot;
  <a href="https://github.com/cosmo-wise/harness-public/issues/new?labels=bug">报告问题</a> &middot;
  <a href="https://github.com/cosmo-wise/harness-public/issues/new?labels=feature">功能建议</a> &middot;
  <a href="docs/ROADMAP.md">路线图</a>
</div>

---

## 为什么选择 Harness？

AI 编程工具擅长生成代码，但单个文件不等于交付。真正的软件交付需要跨多文件的规划、迭代式的质量检验、多个 Agent 并行执行、基于浏览器的可视化验证，以及每一步操作的可审计记录。

Harness 填补了代码生成与软件交付之间的鸿沟——规划构建内容、通过多个专用 Agent 生成代码、按照定义的标准评估结果、针对薄弱环节迭代改进，并在每一步捕获证据。

## 功能特性

- **多 Agent 编排** — 为同一任务定义 Planner、Generator、Evaluator 三个 Agent，各自独立上下文运行，支持可配置超时和模型后端。
- **迭代式评分优化** — 在多次迭代中运行编码循环，根据加权标准（功能正确性、代码质量、架构设计、原创性）为每次尝试评分，直至达到分数阈值或改进空间收敛。
- **Render Audit（渲染审计）** — 对生成的前端项目启动浏览器进行视觉验证，捕获布局错乱、控制台错误和渲染缺陷，而不仅仅是测试结果。
- **并行 Sprint 执行** — 当任务可拆分时自动并行执行 Sprint，支持并发机会的自动检测。
- **Trace 证据捕获** — 记录每个阶段（规划、生成、评估、审计）的结构化证据，生成可供下游治理和展示工具消费的可审计链路。
- **配置驱动** — 每次运行由一份 YAML 配置文件定义：任务描述、Agent 设置、评分标准、迭代参数和审计模式，无需修改代码即可重新配置。
- **多模型支持** — 支持 Claude (Anthropic)、GPT (OpenAI) 和自定义模型端点。企业客户可使用离线/隔离环境部署。
- **人工审批** — 运行可在决策点暂停，等待人工审查、批准或拒绝。

## 快速开始

最快的体验方式是通过公开示例任务运行 Harness。

### 运行基础 LRU Cache 任务

```bash
harness run -c examples/tasks/01-lru-cache/harness.yaml \
  --working-dir ./output/01-lru-cache
```

该命令运行一个多 Agent 循环，对 TypeScript LRU Cache 类进行规划、实现和评估，最多迭代 4 轮直到满足评分标准。

### 运行前端渲染审计

```bash
harness run -c examples/tasks/10-frontend-render-audit/harness.yaml \
  --working-dir ./output/10-frontend-render-audit
```

Harness 生成一个 Vite + React 着陆页，然后启动浏览器对渲染结果进行布局、控制台错误和视觉完整度审计。

## 使用方式

### 定义任务

一个 Harness 任务即一份 YAML 配置文件：

```yaml
task: |
  实现一个 TypeScript LRU Cache 类。
  包含完整的 vitest 测试套件。

agents:
  planner:
    cli: claude
    timeout: 300000
  generator:
    cli: claude
    timeout: 600000
  evaluator:
    cli: claude
    timeout: 300000

iterations:
  max: 4
  scoreThreshold: 85
  minImprovement: 3

criteria:
  - name: functionality
    weight: 40
  - name: code_quality
    weight: 30
  - name: architecture
    weight: 20
  - name: originality
    weight: 10
```

### 评分机制

每次运行产生 0-100 分，基于加权的评分标准。循环在以下任一条件满足时停止：

- 分数达到 `scoreThreshold`
- 两次迭代间的提升低于 `minImprovement`
- 迭代次数达到 `max`

### 可用示例

| 任务 | 类型 | 说明 |
|------|------|------|
| `examples/tasks/01-lru-cache/harness.yaml` | 编码循环 | 最小可复现的 Agent 编码循环 |
| `examples/tasks/10-frontend-render-audit/harness.yaml` | 渲染审计 | 前端生成 + 浏览器验证 |

## 适用场景

- **运行多步骤 AI 编码任务**，需要规划、迭代和验证
- **需要代码质量门禁**——对生成结果进行自动化评分
- **用 AI 构建前端项目**，需要基于浏览器的可视化审计
- **需要可审计的操作记录**——清楚每一步做了什么以及结果如何
- **需要并行执行**——将独立 Sprint 分发到多个 Agent 实例并发执行

Harness 不是一个代码补全工具或单文件生成器。它是一个面向结构化、可重复交付工作流的编排层。

## 安装

```bash
npm install -g @cosmo-wise/harness
```

然后使用以下命令运行任务：

```bash
harness run -c <config.yaml> --working-dir <output-dir>
```

社区、商业和企业版支持选项请参见 [SUPPORT.md](SUPPORT.md)。企业客户可使用离线部署。

---

## 工作原理

一次 Harness 运行按以下四个阶段顺序执行：

1. **规划 (Plan)** — Planner Agent 读取任务描述，生成包含文件结构、依赖关系和 Sprint 拆分的构建计划
2. **生成 (Generate)** — Generator Agent 执行计划，跨一个或多个文件生成代码
3. **评估 (Evaluate)** — Evaluator Agent 按照加权标准对输出评分，识别薄弱环节
4. **审计 (Audit)** — 启用时，基于浏览器的渲染审计对前端输出进行视觉检查

若分数低于阈值，Harness 会携带评估反馈循环回生成阶段。每个阶段通过 [Trace](docs/integrations/trace.md) 协议记录结构化证据。

→ [架构与合约文档](docs/contracts/README.md)

## 配置

Harness 运行完全通过 YAML 配置，关键配置段包括 Agent 定义（模型、CLI、超时）、迭代参数、评分标准、并行执行设置和渲染审计模式。

→ [公开配置指引](configs/README.md)
→ [配置示例](examples/redacted-configs/sample-run.json)

## 公开表面

`harness-public` 是 Harness 的公开仓库，包含：

- **公开示例** — 可复现的任务配置，用于问题报告入口
- **Issue 模板** — 结构化的 Bug、功能建议和示例请求入口
- **文档** — 边界说明、路线图、支持分级、公开合约、集成指南
- **配置指引** — 脱敏后的稳定配置片段

私有 Harness 核心运行时、内部评估策略、专有提示资产和客户特定制品保留在私有仓库中。

→ [边界说明](docs/BOUNDARIES.md)
→ [开源 vs 商业功能划分](docs/boundaries/open-vs-commercial.md)

## 路线图

参见 [ROADMAP.md](docs/ROADMAP.md) 了解当前开发优先级，涵盖三个阶段：公开 Issue 入口与示例、版本发布说明与兼容性矩阵、公开合约稳定化。

## 贡献

`harness-public` 接受公开表面的贡献：文档修正、公开示例、可复现的问题报告和配置指引改进。详见 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 支持

| 级别 | 响应 | 可用性 |
|------|------|--------|
| 社区 | 尽力而为，通过 GitHub Issues | 公开 Discord/Slack |
| 商业 | 2 个工作日内邮件回复 | 付费 |
| 企业 | 关键问题 4 小时响应，SLA 保障，专属工程师 | 付费 |

详见 [支持分级](docs/support/support-tiers.md)。

## 许可

Harness 核心 CLI 为私有产品。公开合约、示例和文档在此仓库中提供。功能划分详见[开源 vs 商业边界](docs/boundaries/open-vs-commercial.md)。

<!-- Reference-style link definitions -->

[bugs-url]: https://github.com/cosmo-wise/harness-public/issues/new?labels=bug
[features-url]: https://github.com/cosmo-wise/harness-public/issues/new?labels=feature
