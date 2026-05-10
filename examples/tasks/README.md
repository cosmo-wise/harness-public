# Public Task Examples

这些样例用于给外部用户提供稳定、可复现的 Harness 问题报告入口，而不是覆盖私有回归资产的全部范围。

当前公开样例优先覆盖两类任务：

- 基础 CLI / coding loop 样例
- 前端 render-audit 样例

## 当前样例

| 任务 | 作用 |
| --- | --- |
| [01-lru-cache](./01-lru-cache/harness.yaml) | 最小可复现的基础 coding-loop 任务 |
| [10-frontend-render-audit](./10-frontend-render-audit/harness.yaml) | 最小可复现的前端 render-audit 任务 |

## 使用方式

```bash
harness run -c examples/tasks/01-lru-cache/harness.yaml --working-dir ./output/01-lru-cache
harness run -c examples/tasks/10-frontend-render-audit/harness.yaml --working-dir ./output/10-frontend-render-audit
```

如果某个问题只能在更复杂的内部任务上稳定复现，应先尽量缩成这里可以公开提交的样例，再进入 public issue 流程。
