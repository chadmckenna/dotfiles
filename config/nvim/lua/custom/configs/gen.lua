require('gen').prompts['Generate_Docs'] = {
  prompt = "Generate documentation for the following code block:\n$text\nUse the most popular documentation tool for the language $filetype. If you don't know infer the tool.\nAlways format responses with Markdown for code blocks with the language prefix e.g language-prefix.",
  replace = false
}
