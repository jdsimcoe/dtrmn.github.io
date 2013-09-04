# Page Select Box Field

- Version: 1.6
- Author: Symphony Team (team@symphony21.com)
- Build Date: 5th July, 2012
- Requirements: Symphony 2.3

## Installation

1. Upload the `pagesfield` folder in this archive to your Symphony `/extensions` folder.

2. Enable it by selecting the "Field: Page Select Box", choose Enable from the with-selected menu, then click Apply.

3. You can now add the "Page Select Box" field to your sections.

## Sorting

The field sorts the pages according to the sortorder determined in 'Blueprints » Pages'. If the sorting isn't correct, it's probably because of the sortorder. To set the sortorder of your pages, edit your config.php-file, set symphony/pages_table_nest_children to yes, and sort the pages manually in your pages screen. When done, you can set symphony/pages_table_nest_children back to no (or keep it on yes, if that is your prefered way of working).
