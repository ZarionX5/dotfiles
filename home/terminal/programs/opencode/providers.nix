{
  config = {
    ollama-local = {
      npm = "@ai-sdk/openai-compatible";
      name = "Ollama (local)";
      options = {
        baseURL = "http://127.0.0.1:11434/v1";
      };
      models = {
        "granite4:tiny-h" = {
          name = "Granite4 7b";
        };
        "lfm2.5-thinking:latest" = {
          name = "Lfm2.5 1.2b";
        };
        "qwen2.5-coder:14b" = {
          name = "Qwen2.5 coder 14b";
        };
        "qwen2.5-coder:7b-instruct-q4_K_M" = {
          name = "Qwen2.5 coder 7b";
        };
      };
    };
    ollama = {
      npm = "@ai-sdk/openai-compatible";
      name = "Ollama (remote)";
      options = {
        baseURL = "http://192.168.10.174:11434/v1";
      };
      models = {
        "gpt-oss:20b" = {
          name = "GPT-oss 20B";
        };
        "gpt-oss:20b-low" = {
          id = "gpt-oss:20b";
          name = "GPT-oss 20B (low)";
          options = {
            reasoningEffort = "low";
            textVerbosity = "low";
            reasoningSummary = "auto";
          };
        };
        "qwen3:4b-instruct" = {
          name = "Qwen3 4B Instruct";
        };
        "qwen3:14b-q4_K_M" = {
          name = "Qwen3 14B";
        };
      };
    };
  };
}
