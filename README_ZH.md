<p>
  <a href="https://www.aihero.dev/s/skills-newsletter">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://res.cloudinary.com/total-typescript/image/upload/v1777382277/skills-repo-dark_2x.png">
      <source media="(prefers-color-scheme: light)" srcset="https://res.cloudinary.com/total-typescript/image/upload/v1777382277/skill-repo-light_2x.png">
      <img alt="Skills" src="https://res.cloudinary.com/total-typescript/image/upload/v1777382277/skill-repo-light_2x.png" width="369">
    </picture>
  </a>
</p>

# 面向真正工程师的 Skills

[![skills.sh](https://skills.sh/b/mattpocock/skills)](https://skills.sh/mattpocock/skills)

这是我每天用来做真正工程工作的 agent skills — 不是 vibe coding。

开发真正的应用程序是困难的。像 GSD、BMAD 和 Spec-Kit 这样的方法论试图通过掌控流程来提供帮助，但这样做却剥夺了你的控制权，并且使流程中的 bug 难以解决。

这些 skills 的设计理念是：小巧、易于修改、可组合。它们适用于任何模型。它们基于数十年的工程经验。随意修改它们，让它们成为你自己的。享受吧。

如果你想了解这些 skills 的更新以及我创建的新技能，可以加入我的 Newsletter（已有约 60,000 名开发者订阅）：

[订阅 Newsletter](https://www.aihero.dev/s/skills-newsletter)

## 快速开始（30 秒安装）

1. 运行 skills.sh 安装器：

```bash
npx skills@latest add mattpocock/skills
```

2. 选择你想要的 skills，以及你想将它们安装到哪些 coding agent 上。**确保选择 `/setup-matt-pocock-skills`**。

3. 在你的 agent 中运行 `/setup-matt-pocock-skills`。它会：
   - 询问你想使用哪个 issue 追踪器（GitHub、Linear 或本地文件）
   - 询问你在分类 issue 时使用什么标签（`/triage` 使用标签）
   - 询问你想把创建的文档保存在哪里

4. 好了 — 准备开始。

## 作为 Claude Code 插件安装

更喜欢即插即用、无需手动维护的安装方式？这些 skills 也以原生 [Claude Code 插件](https://code.claude.com/docs/en/plugins) 形式提供。插件将整个技能集作为托管包安装，当我发布新版本时它会自动更新 — 你订阅而非 fork。

在 Claude Code 中：

```
/plugin marketplace add mattpocock/skills
/plugin install mattpocock-skills@mattpocock
```

或者从终端：

```bash
claude plugin marketplace add mattpocock/skills
claude plugin install mattpocock-skills@mattpocock
```

然后在每个仓库中运行一次 `/setup-matt-pocock-skills`，与上面的快速开始完全相同。

两种安装方式，两种理念：

- **[skills.sh](https://skills.sh/mattpocock/skills)** 将 skills 复制到你的项目中，以便你可以修改它们，让它们成为你自己的。
- **插件** 将它们作为只读、始终最新的包来维护 — 最适合你只想使用我的技能集并跟随它演进的场景。

> 使用 Codex 或其他 agent？[skills.sh 安装器](https://skills.sh/mattpocock/skills) 已经可以将这些 skills 安装到 Codex 和其他 Agent-Skills 标准的 harness 中。原生 Codex 插件已在路线图上 — 参见 [`.agents/adr/0002-ship-as-a-claude-code-plugin.md`](./.agents/adr/0002-ship-as-a-claude-code-plugin.md)。

## 为什么要有这些 Skills

我构建这些 skills 是为了解决我在使用 Claude Code、Codex 和其他 coding agent 时经常遇到的失败模式。

### #1：Agent 没有按我的意图做事

> "没有人确切地知道自己想要什么"
>
> David Thomas & Andrew Hunt，[《程序员修炼之道》](https://www.amazon.co.uk/Pragmatic-Programmer-Anniversary-Journey-Mastery/dp/B0833F1T3V)

**问题**。软件开发中最常见的失败模式是目标不一致。你以为开发者知道你想要什么，然后你看到他们构建的东西 — 才发现它根本没有理解你的意图。

在 AI 时代也是如此。你和 agent 之间存在沟通鸿沟。解决方案是进行一次 **盘问（grilling session）** — 让 agent 就你正在构建的内容向你提出详细问题。

**解决方案** 是使用：

- [`/grill-me`](./skills/productivity/grill-me/SKILL.md) — 用于非代码场景
- [`/grill-with-docs`](./skills/engineering/grill-with-docs/SKILL.md) — 与 `/grill-me` 相同，但增加了更多功能（见下文）

这些是我最受欢迎的 skills。它们帮助你在开始之前与 agent 对齐，并深入思考你要做的变更。**每次**你想做变更时都使用它们。

### #2：Agent 过于啰嗦

> "有了统一语言，开发者之间的对话和代码的表达都源自同一个领域模型。"
>
> Eric Evans，[《领域驱动设计》](https://www.amazon.co.uk/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215)

**问题**：在项目开始时，开发者和他们为之构建软件的人（领域专家）通常说不同的语言。

我对我的 agent 也有同样的感受。Agent 通常被丢进一个项目，然后被要求边干边弄明白行话。所以它们用 20 个字来说 1 个字就能说清楚的事。

**解决方案** 是建立共享语言。这是一份帮助 agent 解码项目中行话的文档。

<details>
<summary>
示例
</summary>

这是我 `course-video-manager` 仓库中的一个 [`CONTEXT.md`](https://github.com/mattpocock/course-video-manager/blob/076a5a7a182db0fe1e62971dd7a68bcadf010f1c/CONTEXT.md) 示例。哪个更容易理解？

- **之前**："当课程某一节中的一课被'实体化'（即在文件系统中被分配了一个位置）时会出现问题"
- **之后**："实体化级联出了问题"

这种简洁性会在每次对话中带来回报。

</details>

这个功能内置于 [`/grill-with-docs`](./skills/engineering/grill-with-docs/SKILL.md) 中。它是一个盘问会话，但同时帮助你与 AI 建立共享语言，并将难以解释的决策记录在 ADR 中。

这很难用语言形容它的强大。这可能是这个仓库中最酷的技巧。试试看吧。

> [!TIP]
> 共享语言除了减少啰嗦之外还有许多其他好处：
>
> - **变量、函数和文件命名更加一致**，使用共享语言
> - 因此，**agent 更容易导航代码库**
> - Agent 在**思考上花费更少的 token**，因为它可以使用更简洁的语言

### #3：代码不工作

> "始终采取小的、谨慎的步骤。反馈的速度就是你的速度极限。永远不要承担太大的任务。"
>
> David Thomas & Andrew Hunt，[《程序员修炼之道》](https://www.amazon.co.uk/Pragmatic-Programmer-Anniversary-Journey-Mastery/dp/B0833F1T3V)

**问题**：假设你和 agent 对要构建的内容已经达成一致。但如果 agent **仍然**生产出垃圾代码呢？

是时候审视你的反馈循环了。如果没有关于它生产的代码实际如何运行的反馈，agent 就像在盲飞。

**解决方案**：你需要通常的反馈循环套件：静态类型、浏览器访问和自动化测试。

对于自动化测试，红-绿-重构循环至关重要。这就是 agent 先写一个失败的测试，然后修复测试。这有助于给 agent 提供一致的反馈水平，从而产生更好的代码。

我构建了一个 **[`/tdd`](./skills/engineering/tdd/SKILL.md) skill**，你可以将其插入任何项目。它鼓励红-绿-重构，并为 agent 提供关于什么构成好测试和坏测试的充分指导。

对于调试，我还构建了一个 **[`/diagnosing-bugs`](./skills/engineering/diagnosing-bugs/SKILL.md)** skill，它将最佳调试实践包装成一个简单的循环。

### #4：我们构建了一个大泥球

> "**每天**都投资于系统设计。"
>
> Kent Beck，[《解析极限编程》](https://www.amazon.co.uk/Extreme-Programming-Explained-Embrace-Change/dp/0321278658)

> "最好的模块是深的。它们允许通过简单的接口访问大量功能。"
>
> John Ousterhout，[《软件设计哲学》](https://www.amazon.co.uk/Philosophy-Software-Design-2nd/dp/173210221X)

**问题**：大多数用 agent 构建的应用都是复杂且难以修改的。因为 agent 可以极大地加速编码，它们也加速了软件熵。代码库以前所未有的速度变得复杂。

**解决方案** 是一种全新的 AI 驱动开发方法：**关心代码的设计**。

这内置于这些 skills 的每一层中：

- [`/to-spec`](./skills/engineering/to-spec/SKILL.md) 在创建 spec 之前询问你正在触及哪些模块

而关键的 [`/improve-codebase-architecture`](./skills/engineering/improve-codebase-architecture/SKILL.md) 帮助你拯救已经变成大泥球的代码库。我建议每几天在你的代码库上运行一次。

### 总结

软件工程基础知识比以往任何时候都更重要。这些 skills 是我将这些基础知识浓缩为可重复实践的最佳努力，帮助你交付职业生涯中最好的应用。享受吧。

## 参考

这些 skills 按一个维度划分 — 谁能调用它们。**用户调用（User-invoked）** 的技能只有在你输入时才能触发（例如 `/grill-me`）；它们的工作是编排。**模型调用（Model-invoked）** 的技能可以由你触发，也可以由 agent 在任务匹配时自动调用；它们持有可重复使用的规范。用户调用的 skill 可以调用模型调用的 skill，但不能调用另一个用户调用的 skill。

### Engineering

我日常用于代码工作的 skills。

**User-invoked（用户调用）**

- **[ask-matt](./skills/engineering/ask-matt/SKILL.md)** — 询问哪个 skill 或工作流适合你的场景。本仓库中用户调用技能的路由器。
- **[grill-with-docs](./skills/engineering/grill-with-docs/SKILL.md)** — 盘问会话，同时构建项目的领域模型，精炼术语并更新 `CONTEXT.md` 和 ADR。
- **[triage](./skills/engineering/triage/SKILL.md)** — 通过分类角色状态机推动 issue 流转。
- **[improve-codebase-architecture](./skills/engineering/improve-codebase-architecture/SKILL.md)** — 扫描代码库寻找深化机会，以可视化 HTML 报告呈现，然后盘问你选择的任意一个。
- **[setup-matt-pocock-skills](./skills/engineering/setup-matt-pocock-skills/SKILL.md)** — 为此仓库配置工程 skills（issue 追踪器、分类标签、领域文档布局）。在使用其他工程 skills 之前，每个仓库运行一次。
- **[to-spec](./skills/engineering/to-spec/SKILL.md)** — 将当前对话转化为 spec 并发布到 issue 追踪器。无需访谈 — 仅综合你已经讨论过的内容。
- **[to-tickets](./skills/engineering/to-tickets/SKILL.md)** — 将任何计划、spec 或对话拆分为一组 tracer-bullet tickets，每个 ticket 声明其阻塞边缘 — 以文本形式写入本地文件，或作为真实追踪器上的原生阻塞链接。
- **[implement](./skills/engineering/implement/SKILL.md)** — 根据 spec 或一组 tickets 构建工作，在预先约定的接口处驱动 `/tdd`，并在提交前以 `/code-review` 收尾。
- **[wayfinder](./skills/engineering/wayfinder/SKILL.md)** — 规划超大规模的工作（超过一个 agent 会话的容量），以 issue 追踪器上的决策 tickets 地图形式呈现 — 逐一解决它们，直到通往目的地的道路清晰。

**Model-invoked（模型调用）**

- **[prototype](./skills/engineering/prototype/SKILL.md)** — 构建一次性原型来回答设计问题 — 对于状态/逻辑问题创建一个可运行的终端应用，或从单个路由可切换的多个截然不同的 UI 变体。
- **[diagnosing-bugs](./skills/engineering/diagnosing-bugs/SKILL.md)** — 针对硬 bug 和性能回归的有纪律的诊断循环：复现 → 最小化 → 假设 → 检测 → 修复 → 回归测试。
- **[research](./skills/engineering/research/SKILL.md)** — 针对高可信度主要来源调查问题，将结果作为带引用的 Markdown 文件捕获到仓库中，以后台 agent 运行。
- **[tdd](./skills/engineering/tdd/SKILL.md)** — 采用红-绿-重构循环的测试驱动开发。一次一个垂直切片地构建特性或修复 bug。
- **[domain-modeling](./skills/engineering/domain-modeling/SKILL.md)** — 主动构建和打磨项目的领域模型 — 对照词汇表质疑术语，用边缘场景案例进行压力测试，并内联更新 `CONTEXT.md` 和 ADR。
- **[codebase-design](./skills/engineering/codebase-design/SKILL.md)** — 深度模块设计的共享规范和词汇：大量行为通过小型接口暴露，放置在干净的接缝处，通过该接口可测试。
- **[code-review](./skills/engineering/code-review/SKILL.md)** — 对自某个固定点以来的差异进行双轴审查：**标准（Standards）**（是否遵循仓库的编码标准，加上 Fowler 代码坏味基线？）和 **Spec**（是否忠实实现了原始 issue/PRD？），以并行子代理运行，互不污染。
- **[resolving-merge-conflicts](./skills/engineering/resolving-merge-conflicts/SKILL.md)** — 逐块处理正在进行的 git merge 或 rebase 冲突，通过追溯到每一侧的主要来源来按意图解决，然后完成操作 — 绝不 `--abort`。

### Productivity

通用工作流工具，非代码特定。

**User-invoked（用户调用）**

- **[grill-me](./skills/productivity/grill-me/SKILL.md)** — 针对计划或设计被穷追不舍地盘问，直到决策树的每个分支都被解决。
- **[handoff](./skills/productivity/handoff/SKILL.md)** — 将当前对话压缩成一份交接文档，以便另一个 agent 可以继续工作。
- **[teach](./skills/productivity/teach/SKILL.md)** — 在多个会话中教授用户一项新技能或概念，将当前目录作为有状态的教学工作区。
- **[writing-great-skills](./skills/productivity/writing-great-skills/SKILL.md)** — 编写和编辑优秀技能的参考资料：使 skill 可预测的词汇和原则。

**Model-invoked（模型调用）**

- **[grilling](./skills/productivity/grilling/SKILL.md)** — 对计划、决定或想法穷追不舍地盘问用户，直到决策树的每个分支都被解决。`grill-me` 和 `grill-with-docs` 背后复用的循环。

---

## Skills 总览

本仓库包含以下 skills，按目录分组列出。

### 📁 engineering

#### ask-matt
- **英文**: Ask which skill or flow fits your situation. A router over the skills in this repo.
- **中文**: 当你面对多个技能或工作流不确定该用哪个时，ask-matt 会分析你当前的场景和需求，推荐最适合的技能。它相当于本仓库所有技能的智能路由入口，帮助你从繁杂的工具集中快速定位到正确的工具。

#### code-review
- **英文**: Review the changes since a fixed point (commit, branch, tag, or merge-base) along two axes — Standards (does the code follow this repo's documented coding standards?) and Spec (does the code match what the originating issue/PRD asked for?). Runs both reviews in parallel sub-agents and reports them side by side. Use when the user wants to review a branch, a PR, work-in-progress changes, or asks to "review since X".
- **中文**: 对代码变更进行双维度并行审查：「标准合规」维度检查代码是否遵循仓库记录的编码标准（包括 Fowler 代码坏味基线）；「功能规格」维度检查代码是否忠实实现了原始 issue 或 PRD 的要求。两个维度的审查由并行子代理独立运行，避免相互污染上下文，最终并排呈现审查结果。适用于审查分支、PR、进行中的改动，或要求"审查自某个时间点以来的变更"。

#### codebase-design
- **英文**: Shared vocabulary for designing deep modules. Use when the user wants to design or improve a module's interface, find deepening opportunities, decide where a seam goes, make code more testable or AI-navigable, or when another skill needs the deep-module vocabulary.
- **中文**: 提供深度模块设计的共享规范和词汇。当你需要设计或改进模块接口、寻找深化机会、决定接缝位置、使代码更易测试或更利于 AI 导航时使用，也可供其他 skill 引用深度模块设计词汇。

#### diagnosing-bugs
- **英文**: Diagnosis loop for hard bugs and performance regressions. Use when the user says "diagnose"/"debug this", or reports something broken/throwing/failing/slow.
- **中文**: 针对棘手 bug 和性能回退的规范化诊断循环。当用户说"诊断"/"调试一下"，或报告某些功能损坏、抛出异常、运行失败、响应缓慢时使用。遵循复现 → 最小化 → 假设 → 检测 → 修复 → 回归测试的严谨流程。

#### domain-modeling
- **英文**: Build and sharpen a project's domain model. Use when the user wants to pin down domain terminology or a ubiquitous language, record an architectural decision, or when another skill needs to maintain the domain model.
- **中文**: 构建和精炼项目的领域模型。当需要确定领域术语或统一语言、记录架构决策、或其他 skill 需要维护领域模型时使用。帮助团队建立共享的领域理解，减少沟通歧义。

#### grill-with-docs
- **英文**: A relentless interview to sharpen a plan or design, which also creates docs (ADR's and glossary) as we go.
- **中文**: 在穷追不舍地盘问中精炼计划或设计，同时产出文档（架构决策记录 ADR 和术语表）。不仅能帮你想得更透彻，还能将讨论成果以文档形式沉淀下来，是仓库中最强大的技巧之一。

#### implement
- **英文**: Implement a piece of work based on a spec or set of tickets.
- **中文**: 根据 spec 或一组 tickets 实现具体工作。在预先约定的接口处驱动 TDD 流程，并在提交前自动执行 code review，确保代码质量。

#### improve-codebase-architecture
- **英文**: Scan a codebase for deepening opportunities, present them as a visual HTML report, then grill through whichever one you pick.
- **中文**: 扫描整个代码库寻找深化设计的机会，将发现结果以可视化 HTML 报告形式呈现，然后针对你选择的机会进行深入盘问和改进。建议每几天在你的代码库上运行一次，防止软件熵的累积。

#### prototype
- **英文**: Build a throwaway prototype to answer a design question. Use when the user wants to sanity-check whether a state model or logic feels right, or explore what a UI should look like.
- **中文**: 构建一次性原型来回答特定的设计问题。当你需要验证状态模型或逻辑是否合理、探索 UI 应该长什么样时使用。对于状态/逻辑问题创建可运行的终端应用，对于 UI 问题创建可切换的多个变体。

#### research
- **英文**: Investigate a question against high-trust primary sources and capture the findings as a Markdown file in the repo. Use when the user wants a topic researched, docs or API facts gathered, or reading legwork delegated to a background agent.
- **中文**: 针对高可信度的主要来源（官方文档、标准规范等）调查问题，将调查结果以带引用的 Markdown 文件形式保存到仓库中。当你需要研究某个话题、收集文档或 API 事实、或将阅读调研工作委托给后台 agent 时使用。

#### resolving-merge-conflicts
- **英文**: Use when you need to resolve an in-progress git merge/rebase conflict.
- **中文**: 当你需要解决正在进行的 git merge 或 rebase 冲突时使用。逐块处理冲突文件，通过追溯每一侧代码的原始意图来做出正确的解决决策，然后完成合并操作。绝不使用 `--abort`。

#### setup-matt-pocock-skills
- **英文**: Configure this repo for the engineering skills — set up its issue tracker, triage label vocabulary, and domain doc layout. Run once before first use of the other engineering skills.
- **中文**: 为此仓库配置工程技能所需的基础设施 — 设置 issue 追踪器（GitHub/Linear/本地文件）、分类标签词汇表和领域文档布局。在使用其他工程技能之前，每个仓库运行一次。

#### tdd
- **英文**: Test-driven development. Use when the user wants to build features or fix bugs test-first, mentions "red-green-refactor", or wants integration tests.
- **中文**: 采用红-绿-重构循环的测试驱动开发。当你希望以测试先行的方式构建功能或修复 bug、提到"红-绿-重构"、或需要集成测试时使用。一次构建一个垂直切片，确保每一步都有测试覆盖。

#### to-spec
- **英文**: Turn the current conversation into a spec and publish it to the project issue tracker — no interview, just synthesis of what you've already discussed.
- **中文**: 将当前对话内容直接转化为一份规范文档（spec）并发布到项目的 issue 追踪器。无需额外访谈，仅综合你们已经讨论过的内容，快速将共识固化为文档。

#### to-tickets
- **英文**: Break a plan, spec, or the current conversation into a set of tracer-bullet tickets, each declaring its blocking edges, published to the configured tracker — edges as text in one file per ticket locally, or native blocking links on a real tracker.
- **中文**: 将计划、spec 或当前对话拆分为一组 tracer-bullet 风格的 tickets。每个 ticket 声明其阻塞边缘（依赖关系），发布到已配置的追踪器上。支持本地以每个 ticket 一个文件的形式保存，或在真实追踪器上使用原生阻塞链接。

#### triage
- **英文**: Move issues and external PRs through a state machine of triage roles — categorise, verify, grill if needed, and write agent-ready briefs.
- **中文**: 通过分类角色的状态机推动 issue 和外部 PR 的流转 — 自动分类、验证、必要时盘问澄清、并编写 agent 可直接使用的简报。帮助你系统化管理 issue 队列。

#### wayfinder
- **英文**: Plan a huge chunk of work — more than one agent session can hold — as a shared map of decision tickets on your issue tracker, and resolve them one at a time until the way to the destination is clear.
- **中文**: 规划超大规模的工作（超过单个 agent 会话的处理能力），以 issue 追踪器上的决策 tickets 共享地图形式呈现。逐一解决这些 tickets，直到通往目的地的道路完全清晰。

### 📁 productivity

#### grill-me
- **英文**: A relentless interview to sharpen a plan or design.
- **中文**: 针对你的计划或设计进行穷追不舍地盘问，直到决策树的每个分支都被彻底解决。适用于非编码场景，帮助你在动手之前想清楚每一个细节，是最受欢迎的 skills 之一。

#### grilling
- **英文**: Grill the user relentlessly about a plan, decision, or idea. Use when the user wants to stress-test their thinking, or uses any 'grill' trigger phrases.
- **中文**: 对计划、决定或想法进行穷追不舍地盘问。当用户想要压力测试自己的思路、或使用任何"盘问"类触发词时使用。这是 `grill-me` 和 `grill-with-docs` 背后复用的核心循环逻辑。

#### handoff
- **英文**: Compact the current conversation into a handoff document for another agent to pick up.
- **中文**: 将当前对话压缩成一份精炼的交接文档，以便另一个 agent 可以无缝接续工作。包含关键上下文、已做决策、待办事项等，确保交接不丢失信息。

#### teach
- **英文**: Teach the user a new skill or concept, within this workspace.
- **中文**: 在当前工作区内教授用户一项新技能或概念。支持多个会话的持续学习，使用教学工作区来跟踪学习进度、维护知识库和练习记录。

#### writing-great-skills
- **英文**: Reference for writing and editing skills well — the vocabulary and principles that make a skill predictable.
- **中文**: 编写和编辑优秀技能的参考资料。定义了使 skill 可预测的词汇表和设计原则，帮助你创建行为一致、易于理解和维护的技能。

### 📁 misc

#### git-guardrails-claude-code
- **英文**: Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, branch -D, etc.) before they execute. Use when user wants to prevent destructive git operations, add git safety hooks, or block git push/reset in Claude Code.
- **中文**: 在 Claude Code 中设置 git hooks，在执行前阻止危险的 git 命令（如 push、reset --hard、clean、branch -D 等）。当你想防止破坏性 git 操作、添加 git 安全钩子、或在 Claude Code 中禁止 git push/reset 时使用。

#### migrate-to-shoehorn
- **英文**: Migrate test files from `as` type assertions to @total-typescript/shoehorn. Use when user mentions shoehorn, wants to replace `as` in tests, or needs partial test data.
- **中文**: 将测试文件中的 `as` 类型断言迁移到 `@total-typescript/shoehorn`。当用户提到 shoehorn、想要替换测试中的 `as` 断言、或需要部分测试数据时使用。

#### scaffold-exercises
- **英文**: Create exercise directory structures with sections, problems, solutions, and explainers that pass linting. Use when user wants to scaffold exercises, create exercise stubs, or set up a new course section.
- **中文**: 创建结构完整的练习目录，包含章节、问题、解答和讲解文件，且通过 lint 检查。当用户想要搭建练习框架、创建练习模板或设置新的课程章节时使用。

#### setup-pre-commit
- **英文**: Set up Husky pre-commit hooks with lint-staged (Prettier), type checking, and tests in the current repo. Use when user wants to add pre-commit hooks, set up Husky, configure lint-staged, or add commit-time formatting/typechecking/testing.
- **中文**: 在当前仓库中设置 Husky pre-commit hooks，包含 lint-staged（Prettier 格式化）、类型检查和测试。当用户想要添加 pre-commit 钩子、配置 Husky、设置 lint-staged、或在提交时自动格式化/类型检查/测试时使用。

### 📁 personal

#### edit-article
- **英文**: Edit and improve articles by restructuring sections, improving clarity, and tightening prose. Use when user wants to edit, revise, or improve an article draft.
- **中文**: 通过重组章节结构、提高清晰度和精简文笔来编辑和改进文章。适用于需要编辑、修订或改进文章草稿的场景。

#### obsidian-vault
- **英文**: Search, create, and manage notes in the Obsidian vault with wikilinks and index notes. Use when user wants to find, create, or organize notes in Obsidian.
- **中文**: 在 Obsidian 笔记库中搜索、创建和管理笔记，支持 wiki 链接和索引笔记。适用于需要在 Obsidian 中查找、创建或组织笔记的场景。

### 📁 in-progress

#### batch-grill-me
- **英文**: A relentless interview that asks every frontier question at once, round by round.
- **中文**: 一种改进的盘问方式，每轮同时提出所有前沿问题，而不是逐个提问。盘问效率更高，适合已经熟悉盘问流程的用户。

#### claude-handoff
- **英文**: Hand the current conversation off to a fresh background agent that picks up the work immediately.
- **中文**: 将当前对话无缝交接给一个全新的后台 agent，让它立即接手工作。适合需要长时间运行的任务或需要切换上下文的场景。

#### loop-me
- **英文**: Grill me about specs for the workflows I want to build, within this workspace.
- **中文**: 在当前工作区内，通过盘问帮助你梳理想要构建的工作流的 spec。通过多个会话的迭代，将模糊的想法转变为可实现的 workflow 规范。

#### setup-ts-deep-modules
- **英文**: Wire dependency-cruiser into a TypeScript repo so each package is a deep module — implementation hidden in subfolders, reachable only through its entry-point files. User-invoked.
- **中文**: 在 TypeScript 仓库中配置 dependency-cruiser，使每个包成为一个深度模块 — 实现代码隐藏在子文件夹中，只能通过入口文件访问。帮助实施模块封装，降低耦合度。

#### to-questionnaire
- **英文**: Turn a decision you can't fully answer into a questionnaire for someone else to fill in.
- **中文**: 将你无法完全回答的决策问题转化为一份问卷，交给其他人来填写。当你需要依赖他人（领域专家、产品经理等）提供信息来做出决策时使用。

#### wizard
- **英文**: Generate an interactive bash wizard that walks a human through a manual procedure — third-party setup, a one-off migration, an A→B state transition — opening URLs, capturing values, confirming each step, and writing .env files and GitHub Actions secrets.
- **中文**: 生成交互式 bash 向导脚本，引导人工执行手动操作流程 — 第三方工具设置、一次性迁移、A→B 状态转换等。可以自动打开 URL、捕获用户输入值、确认每一步、并写入 .env 文件和 GitHub Actions secrets。

#### writing-beats
- **英文**: Writing, exploit — assemble raw material into a journey of beats, grounding each term before a beat leans on it.
- **中文**: 写作的"利用"阶段 — 将原始素材组装成一段"节拍"旅程，在每个节拍使用术语之前先对其进行铺垫和解释。适合将零散内容组织成流畅的文章段落。

#### writing-fragments
- **英文**: Writing, explore — mine raw fragments, no structure yet.
- **中文**: 写作的"探索"阶段 — 通过盘问会话挖掘你的写作碎片，此时尚未形成结构。适合在写作初期收集灵感、素材和思路碎片。

#### writing-shape
- **英文**: Writing, exploit — shape raw material into an article, paragraph by paragraph.
- **中文**: 写作的"利用"阶段 — 将原始素材逐段塑造成文章。适合将分类整理好的内容进一步打磨成完整的文章结构。

### 📁 deprecated

#### design-an-interface
- **英文**: Generate multiple radically different interface designs for a module using parallel sub-agents. Use when user wants to design an API, explore interface options, compare module shapes, or mentions "design it twice".
- **中文**: 使用并行子代理为模块生成多个截然不同的接口设计方案。当你需要设计 API、探索接口选项、比较模块形态或提到"设计两次"时使用。已被更新的设计方法取代。

#### qa
- **英文**: Interactive QA session where user reports bugs or issues conversationally, and the agent files GitHub issues. Explores the codebase in the background for context and domain language. Use when user wants to report bugs, do QA, file issues conversationally, or mentions "QA session".
- **中文**: 交互式 QA 会话，用户以对话方式报告 bug 或问题，agent 自动在后台探索代码库获取上下文和领域语言，然后提交 GitHub issue。适用于以对话方式报告 bug、进行 QA 或提交 issue 的场景。

#### request-refactor-plan
- **英文**: Create a detailed refactor plan with tiny commits via user interview, then file it as a GitHub issue. Use when user wants to plan a refactor, create a refactoring RFC, or break a refactor into safe incremental steps.
- **中文**: 通过用户访谈创建包含小步骤提交的详细重构计划，然后将其作为 GitHub issue 提交。适用于规划重构、创建重构 RFC、或将重构分解为安全的增量步骤。

#### ubiquitous-language
- **英文**: Extract a DDD-style ubiquitous language glossary from the current conversation, flagging ambiguities and proposing canonical terms. Saves to UBIQUITOUS_LANGUAGE.md. Use when user wants to define domain terms, build a glossary, harden terminology, create a ubiquitous language, or mentions "domain model" or "DDD".
- **中文**: 从当前对话中提取 DDD 风格的统一语言词汇表，标记歧义并推荐规范术语，保存到 UBIQUITOUS_LANGUAGE.md。当用户想要定义领域术语、构建词汇表、强化术语体系、创建统一语言或提到"领域模型"或"DDD"时使用。
