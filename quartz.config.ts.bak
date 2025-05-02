import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Austin's Portfolio",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: true,
    analytics: {
      provider: "google",
	  tagId: "G-V0RKQ91K9C",
    },
    locale: "en-US",
    baseUrl: "austinleekelly.com",
    ignorePatterns: ["private", "templates","**/private/**"],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
		title: "Bebas Neue",
        header: "Inter",
        body: "Roboto",
        code: "IBM Plex Mono",
      },
      colors: {
        lightMode: {
			light: "#f3f8fa",  // Soft blue-tinted background
			lightgray: "#d9dde2",  // Subtle borders
			gray: "#a0a5aa",  // Graph links, heavier borders
			darkgray: "#3c4855",  // Body text
			dark: "#1f2a34",  // Header text and icons
			secondary: "#2978a0",  // Link color, current graph node (deeper blue for distinction)
			tertiary: "#5ea8b9",  // Hover states, visited graph nodes
			highlight: "rgba(41, 120, 160, 0.12)",  // Internal link background, highlighted text/code
			textHighlight: "#fff23688",  // Markdown highlighted text background
		},
		darkMode: {
			light: "#101921",  // Deep slate blue background
			lightgray: "#2c3a47",  // Subtle borders
			gray: "#5a6b79",  // Graph links, heavier borders
			darkgray: "#bac6cf",  // Body text for high readability
			dark: "#e3ebf0",  // Header text and icons
			secondary: "#40d6ee",  // Link color, current graph node
			tertiary: "#2978a0",  // Hover states, visited graph nodes (shifted to separate from secondary)
			highlight: "rgba(64, 214, 238, 0.08)",  // Internal link background, highlighted text/code
			textHighlight: "#b3aa0288",  // Markdown highlighted text background
		},
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [Plugin.RemoveDrafts()],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
	  Plugin.ContentIndex({enableSiteMap: true}),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: false,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.NotFoundPage(),
      // Comment out CustomOgImages to speed up build time
      Plugin.CustomOgImages(),
    ],
  },
}

export default config
