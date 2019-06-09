import builtwith

# The builtwith Python Module
# 1. The builtwith module is a useful tool to check the kind of technologies a website is built.
# 2. The type of technology used to build a website will effect how we crawl it.

print builtwith.parse('http://www.google.com')
print builtwith.parse('http://www.apple.com')
