---
created: 2025-04-12T16:00:10-05:00
modified: 2025-04-29T15:33:09-05:00
---
# Skills

For your **skills pages**, you can organize them similarly by using YAML for internal sorting and structure while still allowing visible tags to help with navigation. This setup will be very efficient for filtering, linking, and providing context while keeping it clean for recruiters.

---

## ✅ Example YAML for Skills (hidden, internal organization)

```yaml
title: Content Strategy
category: general-skills
type: skill
roles:
  - marketing
  - technical-writing
  - content-writing
proficiency: intermediate
related_software:
  - wordpress
  - semrush
  - hubspot
```

### 🔍 Why this YAML helps:

- `category`: Helps categorize your skills (e.g., marketing, technical, general)
    
- `roles`: Links the skill to job functions (helps recruiters understand where it’s applicable)
    
- `proficiency`: Indicating skill level (beginner, intermediate, expert)
    
- `related_software`: Links skills to specific tools you've used for that skill (helps with interlinking)
    

---

## 🏷️ Example Tags (visible on the page)

Use tags directly on the skill page for clarity, focusing on the type of skill and its context.

less

Copy code

`#content-strategy #marketing #technical-writing #copywriting #seo`

---

## 💡 Example Note for `content-strategy.md`

```markdown
---
title: Content Strategy
category: general-skills
type: skill
roles:
  - marketing
  - technical-writing
  - content-writing
proficiency: intermediate
related_software:
  - wordpress
  - semrush
  - hubspot
---

# Content Strategy

Content strategy is about planning, creating, and optimizing content to achieve business goals. I’ve applied content strategy in various roles, focusing on SEO-driven content creation and engagement metrics.

- Created content calendars for SEO-driven articles
- Developed content pillars and topic clusters
- Collaborated with design teams to create content layouts

---

#content-strategy #marketing #technical-writing #copywriting #seo

```
---

## 🔄 Bonus Tip:

If you want to automatically link relevant software/tools from the `related_software` YAML field, you can pull in those tools from your `software` folder using something like **Dataview** in Quartz, which would pull the related software automatically.

For example, if you wanted to list all tools related to a specific skill like `content-strategy`:

dataview

Copy code

`table related_software as "Related Tools" from "software/" where contains(related_software, "wordpress")`

This would generate a list of all software pages with a link to `WordPress` under the skill `Content Strategy`.

---

### 🎯 Summary of Your Skills Structure:

1. **YAML** - Keeps your skill pages organized and easy to filter
    
2. **Tags** - Visible to help recruiters quickly scan for relevant skill types
    
3. **Related Software Links** - Connects skills to tools you’ve used, enhancing interlinking
    

This will help you present a **clean, scalable skills section** while making it easy for you to manage and interlink between your software and skills.

## 
# Software
## 👎 What's Wrong with the Current Structure?

**Structure:**  
`Software (folder)`  
  ↳ `Content Management and SEO (folder)`  
    ↳ `Content Management Software (page)`  
      ↳ HubSpot (listed as a bullet on the page)

### ❌ Problems:

1. **Too many clicks** - A recruiter has to drill 3 layers deep just to find "HubSpot."
    
2. **Harder to interlink** - You can’t easily link to individual tools like `[[HubSpot]]` if they’re just bullet items, not their own notes/pages.
    
3. **Wastes Quartz's strengths** - Quartz auto-lists pages in a folder, so that middle "Content Management Software" page is redundant.
    

---

## ✅ Revamped Structure (Quartz-Optimized)

Here’s a **revised layout** that is flatter, cleaner, and makes everything easier to navigate and link:

```pgsql
/software/
  index.md ← hub page linking to category folders
  /content-management-seo/
    index.md ← short overview + tools auto-listed
    wordpress.md
    hubspot.md
    semrush.md
  /email-marketing-crm/
    index.md
    klaviyo.md
    zoho-crm.md
    mailchimp.md
  /automation-scripting/
    index.md
    powershell.md
    zapier.md

```
---

### 🔁 Benefits of This Layout

|Feature|Value|
|---|---|
|**Easy recruiter scan**|Every tool is 1-2 clicks away, max|
|**Cleaner URLs**|e.g., `/software/email-marketing-crm/klaviyo`|
|**Better interlinking**|You can link directly to `[[Klaviyo]]` or `[[PowerShell]]` from anywhere|
|**Quartz-native**|Folders = categories, tools = auto-listed pages|
|**No redundant mid-pages**|You don’t need “Content Management Software” page anymore  -  just the category folder's `index.md`|

---

### 📝 Example of a Category `index.md` File (like `/content-management-seo/index.md`):

```markdown
# Content Management and SEO Tools

These are tools I've used for CMS, SEO optimization, and content performance tracking. Each has its own page with how I've used it in roles or projects.

---

### Tools
(Automatically listed below by Quartz)

```

---

## ✅ Summary

**Revise from:**  
`Folder > Folder > Page > Tool (bullet)`

**To:**  
`Folder (Category) > Tool Page`


# Skills vs Software

Your **current skills setup sounds great** for quick scanning  -  and it makes sense to **structure software pages slightly differently** because:

---

## 🧩 Key Difference Between Skills vs. Software:

### 🛠️ **Skills = concepts or capabilities**

Think: “copywriting,” “network troubleshooting,” “email segmentation”

- Best grouped into **broad pages** with short, scannable lists
    
- Recruiters want **breadth + categorization** fast
    
- Less need for individual detail pages per skill
    

### 💻 **Software = tools you’ve actually used**

Think: “Klaviyo,” “PowerShell,” “MDT,” “Grammarly”

- Stronger when each tool has **its own mini-page** for:
    
    - how you used it
        
    - in which role
        
    - proficiency level
        
- Quartz auto-lists subpages = perfect for this kind of breakdown
    

---

## ✅ Recommended: Keep Them Structured Differently

### For **Skills**:

Stick with:

- 3-5 main category pages
    
- Bullet-pointed skills
    
- Brief examples if needed

---
### For **Software**:

Use:

- One **master hub page** linking to category folders (Quartz-native)
    
- Category folders with:
    
    - An `index.md` summary
        
    - Individual tool pages for depth (auto-listed by Quartz)
        

---

## 🧠 Think of it This Way:

|Trait|Skills Pages|Software Pages|
|---|---|---|
|Goal|Show what you _can_ do|Show _what tools_ you’ve used|
|Structure|4 broad list-style pages|Folder structure with tool sub-pages|
|Depth Needed|Shallow (mostly list)|Optional deep (individual pages per tool)|
|Best Navigation|Manual grouping|Quartz folder + index + auto-listing|

---

So yes  -  keep your **skills list simple and centralized**, but **let your software structure breathe** and use Quartz’s strengths to your advantage.