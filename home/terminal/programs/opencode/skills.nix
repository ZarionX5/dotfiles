{ pkgs, inputs }:
let
  mkSkill = name: src: path:
    pkgs.stdenv.mkDerivation {
      name = "opencode-skill-${name}";
      inherit src;
      installPhase = "mkdir -p $out; cp ${path} $out/SKILL.md";
    };

  mkSkillDir = name: src: basePath:
    pkgs.stdenv.mkDerivation {
      name = "opencode-skill-${name}";
      inherit src;
      installPhase = "mkdir -p $out; cp -r ${basePath}/* $out/";
    };

  skills = {
    technical-writing = mkSkill "technical-writing" 
      inputs.llm-skills-agentic-qe ".claude/skills/technical-writing/SKILL.md";

    refactoring-patterns = mkSkill "refactoring-patterns" 
      inputs.llm-skills-agentic-qe ".claude/skills/refactoring-patterns/SKILL.md";

    blog-post-writer = mkSkillDir "blog-post-writer" 
      inputs.llm-skills-dotfiles "home/.claude/skills/blog-post-writer";

    frontend-design = mkSkill "frontend-design" 
      inputs.llm-skills-claude-code "plugins/frontend-design/skills/frontend-design/SKILL.md";

    architecture-patterns = mkSkill "architecture-patterns" 
      inputs.llm-skills-agents "plugins/backend-development/skills/architecture-patterns/SKILL.md";

    writing-documentation = mkSkillDir "writing-documentation" 
      inputs.llm-skills-ccconfigs "essentials/skills/writing-documentation";

    skill-creator = mkSkillDir "skill-creator" 
      inputs.llm-skills-skills-repo "skills/skill-creator";

    docker = mkSkillDir "docker" 
      inputs.llm-skills-mjs-agent-skills ".claude/skills/docker";
    
    kafka = mkSkillDir "kafka" 
      inputs.llm-skills-mjs-agent-skills ".claude/skills/kafka";
    
    docker-expert = mkSkill "docker-expert" 
      inputs.llm-skills-awesome "skills/docker-expert/SKILL.md";

    postgres-patterns = mkSkill "postgres-patterns" 
      inputs.llm-skills-everything-claude-code "skills/postgres-patterns/SKILL.md";
    
    database-design-postgresql = mkSkill "database-design-postgresql" 
      inputs.llm-skills-agents "plugins/database-design/skills/postgresql/SKILL.md";

    python-patterns = mkSkill "python-patterns" 
      inputs.llm-skills-everything-claude-code "skills/python-patterns/SKILL.md";
    
    python-testing = mkSkill "python-testing" 
      inputs.llm-skills-everything-claude-code "skills/python-testing/SKILL.md";

    clickhouse-io = mkSkill "clickhouse-io" 
      inputs.llm-skills-everything-claude-code "skills/clickhouse-io/SKILL.md";
    
    backend-patterns = mkSkill "backend-patterns" 
      inputs.llm-skills-everything-claude-code "skills/backend-patterns/SKILL.md";

    fastapi-pro = mkSkill "fastapi-pro" 
      inputs.llm-skills-awesome "skills/fastapi-pro/SKILL.md";
    
    fastapi-templates = mkSkillDir "fastapi-templates" 
      inputs.llm-skills-awesome "skills/fastapi-templates";

    modern-javascript-patterns = mkSkill "modern-javascript-patterns" 
      inputs.llm-skills-agents "plugins/javascript-typescript/skills/modern-javascript-patterns/SKILL.md";
    
    nodejs-backend-patterns = mkSkill "nodejs-backend-patterns" 
      inputs.llm-skills-agents "plugins/javascript-typescript/skills/nodejs-backend-patterns/SKILL.md";
    
    typescript-advanced-types = mkSkill "typescript-advanced-types" 
      inputs.llm-skills-agents "plugins/javascript-typescript/skills/typescript-advanced-types/SKILL.md";
    
    typst-expert = mkSkillDir "typst-expert" 
      inputs.llm-skills-typst "skills/typst";
  };

  allSkills = pkgs.runCommand "opencode-skills" {} ''
    mkdir -p $out/skill
    ${pkgs.lib.concatStringsSep "\n" (pkgs.lib.mapAttrsToList (name: skill: ''
      mkdir -p $out/skill/${name}
      cp -r ${skill}/* $out/skill/${name}/
    '') skills)}
  '';
in {
  packages = [];
  skillsSource = allSkills;
}