A Widget to use that uses the jquery Tweet libary and Twitter Search API to display a list of tweets
jquery seaofclouds URL: http://tweet.seaofclouds.com/
	Optional ContentBox setting:
		tf_title - Title of widget, default: "Twitter Updates"
		tf_loadingtext - Text when tweets are loading, default: "loading tweets..."
		tf_username - username(s) of twitter account to pull tweets from, default: "['coldbox']"
		tf_count - max number of tweets to display, default: 5
		tf_introtext - intro join text, default: ""
		tf_outrotext - outro join text, default: ""
		tf_jointext - join text, default: ""
		tf_autojointextdefault - auto join text default text, default: "i said,"
		tf_autojointexted - auto join texted text, default: "i"
		tf_autojointexting - auto join texting text, default: "i am"
		tf_autojointextreply - auto join reply text, default: "i replied to"
		tf_autojointexturl - auto join text url, default: "i am looking at"
		tf_query - twitter query to return results, ex: "from:coldbox http", default: ""
		tf_cssFile - location of the css file if you don't want to use the default, default: {widgetRoot}/tweetfeed/jquery.tweet.css
		tf_jsFile - location of the css file if you don't want to use the default, default: {widgetRoot}/tweetfeed/jquery.tweet.js

	Usage:

	Call the widget and place it where you want to show your tweets

	#cb.widget('TweetFeed',{settings={"username":["gratzc"]}})#
