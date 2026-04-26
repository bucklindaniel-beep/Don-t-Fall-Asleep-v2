# System To-Do List

## High Priority

### Narration Pattern Layer
- Why: MrBallen-style references add high-value pacing, delivery, and personality mechanics without becoming story-structure sources.
- Impact: improves script quality, sentence rhythm, pause logic, and ElevenLabs readiness.
- Claude impact: extracts narration mechanics only and applies them during narration formatting, not story generation.

### Transcript Duplicate Detection Hardening
- Why: batch intake can accidentally reprocess the same source or create duplicate analysis patterns.
- Impact: prevents memory bloat, repeated distilled outputs, and duplicate pattern files.
- Claude impact: checks source IDs, URLs, metadata, stage files, and existing pattern mechanics before writing.

### Transcript Intelligence Pass
- Why: more high-quality reference material is needed before overbuilding analytics.
- Impact: stronger organic hooks, beats, pacing, vocabulary, and endings.
- Claude impact: extracts mechanics from proven niche content without copying.

### Pattern Scoring + Composition Validation
- Why: new intelligence layer must be tested before adding more systems.
- Impact: prevents memory bloat and pattern homogenization.
- Claude impact: selects fewer, stronger, compatible mechanics.

### Writing Quality Framework Validation
- Why: new centralized rules must be smoke tested against story and narration outputs.
- Impact: reduces procedural narration, repeated phrasing, and weak internal monologue.
- Claude impact: improves story voice without rigid templates.

### Organic Hook + Story Beat Validation
- Why: hooks and beats must feel organic to horror, not clickbait.
- Impact: improves retention while preserving older-viewer trust.
- Claude impact: opens stronger and varies structure across runs.

### Performance Review Layer
- Why: continuity review currently catches correctness better than retention risk.
- Impact: moves validation toward YouTube performance.
- Claude impact: flags weak openings, flat zones, predictable escalation, and missed payoff.

### Batch Transcript Intake
- Why: multiple high-performing videos need to be collected without manual copy/paste.
- Impact: faster reference expansion before transcript intelligence testing.
- Claude impact: receives cleaner raw inputs while analysis remains stage-controlled.

### Playlist Transcript Download Support
- Why: curated playlists can speed reference intake.
- Impact: higher-volume transcript collection at low cost.
- Claude impact: no direct effect; feeds `/transcripts/raw/` only.

### Image Prompt Export System
- Why: Stage 6 prompts need to become executable files later.
- Impact: smoother OpenAI image generation bridge with fewer naming and continuity errors.
- Claude impact: packages prompts with stable shot IDs and continuity locks.

### Image Prompt Reference Intelligence
- Why: high-quality prompt examples can improve visual prompt mechanics.
- Impact: stronger renderability and style consistency without copying source prompts.
- Claude impact: extracts reusable image prompt mechanics only.

## Medium Priority

### API Bridge Architecture
- Why: future OpenAI, ElevenLabs, and YouTube bridges need consistent manifests.
- Impact: smoother automation with lower cost and fewer failures.
- Claude impact: packages outputs into script-ready files without handling secrets.

### Packaging System
- Why: title, thumbnail, description, and tags drive reach.
- Impact: improves YouTube click-through and search alignment.
- Claude impact: generates upload packages after content stabilizes.

### Pattern Performance Tracking
- Why: scoring should eventually use real CTR, retention, comments, and completion data.
- Impact: promotes patterns based on evidence.
- Claude impact: learns from performance, not assumptions.

### Anti-Repetition Cooldown
- Why: repeated structures will cause channel fatigue.
- Impact: keeps long-term output fresh.
- Claude impact: avoids recent hook, narrator, escalation, and ending combinations.

## Low Priority

### Post-Upload Feedback Loop
- Why: requires real channel data.
- Impact: long-term content optimization.
- Claude impact: routes performance insights into future pattern scoring.

### Upload Automation
- Why: useful after packaging and API bridge standards stabilize.
- Impact: reduces manual upload work.
- Claude impact: generates metadata/manifests, not platform strategy.

### Thumbnail Debug Loop
- Why: thumbnails need visual testing and feedback after content style stabilizes.
- Impact: improves CTR.
- Claude impact: generates thumbnail directions and learns from user review.

## Added — Authority Layer Stabilization

### Deferred System Audit — Write-Back Scope
- Why: authority patch pass identified four /systems files not yet validated for implicit auto-write or auto-logging behavior.
- Files to audit: logging_contract.md, memory_logging_system.md, repository_update_system.md, transcript_storage_router.md
- Impact: ensures deferred-logging and write-back-gating rules are consistent across all system files.
- Claude impact: prevents any file implying automatic writes outside of the approved write-back flow.

### EXECUTION LOGGING conflict resolved
- Patch applied to 02_claude_project_instructions.md and claude_desktop_project_instructions_update.md
- Logging is now explicitly deferred by default, aligned with execution_router.md Logging Boundary.

---

### Write-Back Protocol Activation
- Why: Claude needs explicit permission boundaries before writing indexed outputs, pattern updates, logs, or cleanup actions.
- Impact: enables durable learning without accidental overwrites or premature promotion.
- Claude impact: writes only after `write back approved`, with duplicate checks and concise logs.

### Story-Level Compilation Processing
- Why: YouTube compilations and mixed transcript files contain multiple independent stories.
- Impact: prevents cross-story contamination and improves scoring reliability.
- Claude impact: treats each `## Story` section as an independent transcript unit, then aggregates after analysis.

### Metadata Placeholder Safety
- Why: creator/title/URL may be unknown during local transcript prep.
- Impact: preserves traceability without fabricated source data.
- Claude impact: uses `Creator: unknown` and `URL: local_ingest` safely; future metadata systems can patch values later.

### Claude Desktop Instruction Sync Check
- Why: repo logic and Claude Desktop Project Instructions can drift.
- Impact: prevents runtime mismatch after repository updates.
- Claude impact: validate Desktop instructions alongside updated repository files before major execution runs.
