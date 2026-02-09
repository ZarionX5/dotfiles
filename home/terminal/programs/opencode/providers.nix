{
  config = {
    ollama = {
      npm = "@ai-sdk/openai-compatible";
      name = "Ollama (local)";
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