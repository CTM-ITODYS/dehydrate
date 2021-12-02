## Welcome to dehydrate

Remove water molecules on a trajectory file with the help of cpptraj (Amber)

```markdown
usage dehydrate.pl parameter.prmtop trajectory.nc [Y]
```

The goal of this soft is to remove water molecules from a molecular dynamics trajectory. This way, the trajectory requires less disk space. Beware, if you add the 'Y' optional tag at the end of the command file, the input trajectory file will be removed, this procedure cannot be undone.

At the end, you will get two new files (prmtop and nc) with the DRY prefix.

## Sources:

[https://github.com/CTM-ITODYS/dehydrate/archive/refs/tags/1.0.zip]
[https://github.com/CTM-ITODYS/dehydrate/archive/refs/tags/1.0.tar.gz]


You can use the [editor on GitHub](https://github.com/CTM-ITODYS/dehydrate/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.

### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [Basic writing and formatting syntax](https://docs.github.com/en/github/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/CTM-ITODYS/dehydrate/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
