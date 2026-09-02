-- This project is a signpost, not a workspace.
--
-- The EngineSquared learning track ships as an xmake addon, because a template
-- cannot be updated after it has been generated and a curriculum has to be:
-- chapters get added, hints get fixed, an engine API change breaks an exercise.
-- So this template does not carry any exercise. It carries the three commands
-- that fetch the real thing, and the addon generates the workspace you work in.
--
-- Read README.md, then run:
--
--     xmake addon --install github:EngineSquared/learn
--     xmake learn init my-engine-learning
--     cd my-engine-learning && xmake learn
--
-- Requires xmake 3.1.1 or newer.

local project_name = "${TARGET_NAME}"

set_project(project_name)

${FAQ}
