import robotparser

# Parse robots.txt rules
rp = robotparser.RobotFileParser()
rp.set_url('http://www.apple.com/robots.txt')
rp.read()

# Check if a page can be fetched based on the robots.txt parsed rules.
user_agent = 'MyCrawler'
url = 'http://www.apple.com/cn/se/*'
print rp.can_fetch(user_agent, url)

# Check if a page can be fetched based on the robots.txt parsed rules.
url = 'http://www.apple.com/mac/'
print rp.can_fetch(user_agent, url)
