---
aliases: []
created: 2025-04-04T16:38:13-05:00
modified: 2025-05-09T14:48:44-05:00
permalink: Behind-the-Curtain-Obsidian-Quartz
tags:
  - Original
  - Writing
title: ✨ Behind the Curtain (How I Built This Portfolio with Obsidian, Quartz4 and ChatGPT)
---
_A fast, flexible, and free alternative to WordPress (with some quirks)_

This portfolio wasn’t built with drag-and-drop tools or bloated platforms. It runs on a custom setup that reflects how I think, work, and organize ideas. 

It’s fast, minimal, and powered entirely by tools I am starting to trust more and more: **Obsidian**, **Quartz4**, and **ChatGPT**. 

*And best of all, you can make one too if you want!*

**Why I made it:** More than just a website, it’s a living proof-of-concept. It's a hands-on demo of my skills and accomplishments in system design, content organization and creation, version control, automation, and creative problem-solving.

---

### 🧠 Obsidian: My Markdown HQ

[**Obsidian**](https://obsidian.md/) is where I write, organize, and store everything. It’s a local-first Markdown editor that lets me focus entirely on the content, not so much the interface.

**How I use it:**

- Each page on this site starts life as a Markdown file in my Obsidian vault
    
- I rely on **1. Folders**, **2. Tags**, and **3. YAML frontmatter** and to keep things organized:
    ```
	title: Portfolio Setup 
	tags: testimonial, IT
	publish: true
    ```
- **Tags** and **Folders** (and of course Notes)  all power Quartz’s navigation, while **YAML** is my backend schema for filtering and sorting further content specifics logically for my sanity.
    

🔗 [Download - Obsidian](https://obsidian.md/download)

---

### 🌐 Quartz4: From Notes to Public Website

[**Quartz4**](https://quartz.jzhao.xyz/) is a Hugo-based framework designed to turn Obsidian notes into a slick, browsable website. 

Also worth mentioning, you don't need to know anything about Hugo. You don't even need to know anything about web development. It works pretty much out of the box.

**Why I chose Quartz:**

- It works natively with Markdown + YAML
    
- Creates fast, static HTML for **free GitHub Pages hosting**
    
- Supports backlinks, tags, and a graph view
    

#### 🧪 Local Testing + One-Line Deployment

- Preview site locally:
    ```
    npx quartz build --serve
    ```
- Publish to GitHub:
    
    ```
    npx quartz sync
    ```

🔗 [Setup Quartz4](https://quartz.jzhao.xyz/)

---

### 🔄 Sync and Backup: Dropbox + FreeFileSync

To prevent disaster (like the time Quartz failed to upload and wiped my local repo due to a lock error - although that may be to a [nebulous issue surrounding Node](https://github.com/npm/npm/issues/13461)), I use:

- **[Dropbox](https://www.dropbox.com/)** to store my main Obsidian vault
    
- **[FreeFileSync](https://freefilesync.org/)** for a visual confirmation to mirror files into the Quartz folder before deploying
    

This adds an air gap between my live content and the deploy script - just in case.

---

### 🤖 ChatGPT: Creative Partner and Debugging Assistant

Even though, truthfully, AI put a dent in my freelance writing clientele in unforeseen ways...It's hard to shy away from AI. [**ChatGPT**](https://chat.openai.com/) helped shape this project in many ways:

- Clarifying vague ideas
- Drafting this writeup
- Researching Markdown to static-site options
- Generating pretty, templatized output from original source material
- Troubleshooting errors with the setup
- Brainstorming folder structures
  
> Silly enough, even encouragement along the way of when I was doubting this whole thing 🚀    

It was a powerful partner, especially during the planning and refining stages.

---

## ⚠ Obsidian + Quartz: Not Without Its Pains

I like the combo of Obsidian + Quartz, but it’s not perfect.

### 🧩 Organizing Information Can Be a Grind

When you’re dealing with dozens if not hundreds of notes across multiple job roles, skills, and timelines:

- Tags and folders start colliding
    
- Metadata drift becomes a real issue
    
- You need discipline to keep everything tidy and even then (if you're like me) you might drown in your own info
    

### 🕸 Graph View = Potential, But Messy

Quartz includes an on-page graph view, but:

- It’s visually overwhelming without some config tweaks
    
- I still haven’t gotten it to be as readable as I’d like - probably due to my own linking structure more than the tool itself
- It's a native feature to Obsidian and so it's not quite a fault of Quartz itself
    

### 📈 SEO? Looks Good (But Untested)

I haven’t run full audits, but I’ve read that Quartz performs well SEO-wise because:

- Static HTML is lean and fast
    
- No plugin bloat or heavy scripts
    
- Great text-to-code ratio
    

It’s a solid technical foundation for organic search, even if I haven’t focused on it yet.

### 🚫 Biggest Gripe: No Dataview Support

One of Obsidian’s biggest superpowers is the **Dataview plugin** - a tool that lets you create dynamic tables, lists, and dashboards from your notes using custom queries. It’s incredibly useful for organizing certifications, projects, or even tracking habits.

Unfortunately, **Quartz4 doesn’t support Dataview at all**.

That means any advanced filtering, query-driven content, or summary tables I build in Obsidian are **completely invisible** on the live site. It’s a major tradeoff if you rely on Dataview heavily to make your vault smarter and more interactive.

There are workarounds (like generating static views manually), but they’re clunky and time-consuming. I'm sure there's something like the **Templater** plugin that would be more handy, but **ChatGPT** helped me "go to town" to just dump + templatize a lot of the content.

Hopefully, future versions of Quartz will find a way to bridge that gap.

---

## 🆚 Why Not WordPress?

|WordPress|Obsidian + Quartz4|
|---|---|
|Paid hosting|Free via GitHub Pages|
|Plugin/security bloat|Minimal surface area|
|Drag-and-drop CMS|Full control in plain text|
|Slower dynamic load|Blazing fast static HTML|
|Frequent updates|Stable and lean with fewer moving parts|

^1bb531

I’ve used WordPress since around 2008. It’s great for some things, but this site needed **precision, simplicity, and speed**. In particular, speed.

I can't describe the feeling of relief from creating local Markdown file with basic content to a live, polished page with such speed.

**A focus on content, not technicalities.**

I wanted to build something I could **fully understand and control**, without depending on a plugin ecosystem or monthly fees.

---

## 🧠 A Place to Reflect and Showcase

One of the unexpected benefits of building this site was realizing just how much I’ve done over the years.

When you catalog your projects, skills, work history, and certifications in a system you built yourself, you start to notice patterns, connections, and wins you may have forgotten. 

This site became more than a resume for me - it’s now a **personal archive** and a **reminder of progress**.

Every link, every tag, every job description - it's a snapshot of the work, effort, and growth I’ve invested. 

If you've ever felt like you're not moving fast enough, try building your own portfolio like this. 

The clarity is eye-opening.

---

## ✅ Toolchain Summary

- ✍️ [**Obsidian**](https://obsidian.md/) for writing and organization
    
- 🧱 [**Quartz4**](https://quartz.jzhao.xyz/) for static site generation
    
- 🤖 [**ChatGPT**](https://chat.openai.com/) for creative support
    
- ☁️ [**Dropbox**](https://dropbox.com/) for cloud storage
    
- 🔄 [**FreeFileSync**](https://freefilesync.org/) for syncing vault to deploy folder
    
- 🌍 [**GitHub Pages**](https://pages.github.com/) for zero-cost hosting
    

---

## 🏁 Wrap Up

I’ve streamlined some details for clarity, since much of the information is readily available through the software’s website or a quick Google search.

If you’re interested in building a portfolio that reflects how you work, not just what you’ve done. I highly recommend trying this stack. 

Hopefully my portfolio serves as some kind of inspiration for your own.

The setup isn't perfect (but what is?) - but it’s powerful, fast, and dang near 100% yours.
