/**
* A Widget to use that uses the jquery Tweet libary and Twitter Search API to display a list of tweets
* jquery seaofclouds URL: http://tweet.seaofclouds.com/
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

	#cb.widget('TweedFeed',{settings={username='["gratzc"]'}})#

	*/
component extends="contentbox.model.ui.BaseWidget" singleton{

	TweetFeed function init(controller){
		// super init
		super.init(controller);

		// Widget Properties
		setPluginName("TweetFeed");
		setPluginVersion("1.0");
		setPluginDescription("A Widget to use that uses the jquery Tweet libary and Twitter Search API to display a list of tweets");
		setPluginAuthor("Computer Know How");
		setPluginAuthorURL("www.compknowhow.com");
		setForgeBoxSlug("cbwidget-tweetfeed");

		var cb = getPlugin(plugin='CBHelper',module='contentbox');

		variables.tfsettings = {};
		variables.tfsettings.title = cb.setting("tf_title","Twitter Updates");
		variables.tfsettings.loadingtext = cb.setting("tf_loadingtext","loading tweets...");
		variables.tfsettings.username = cb.setting("tf_username","['coldbox']");
		variables.tfsettings.avatarsize = cb.setting("tf_avatarsize","32");
		variables.tfsettings.count = cb.setting("tf_count","5");
		variables.tfsettings.introtext = cb.setting("tf_introtext","");
		variables.tfsettings.outrotext = cb.setting("tf_outrotext","");
		variables.tfsettings.jointext = cb.setting("tf_jointext","");
		variables.tfsettings.autojointextdefault = cb.setting("tf_autojointextdefault","i said,");
		variables.tfsettings.autojointexted = cb.setting("tf_autojointexted","i");
		variables.tfsettings.autojointexting = cb.setting("tf_autojointexting","i am");
		variables.tfsettings.autojointextreply = cb.setting("tf_autojointextreply","i replied to");
		variables.tfsettings.autojointexturl = cb.setting("tf_autojointexturl","i am looking at");
		variables.tfsettings.query = cb.setting("tf_query","");
		var assetRoot = cb.widgetRoot() & "/tweetFeed/";
		var css = assetRoot&'/jquery.tweet.css';
		var js =  assetRoot&'/jquery.tweet.js';
		variables.tfsettings.cssFile = cb.setting("tf_cssFile",css);
		variables.tfsettings.jsFile = cb.setting("tf_jsFile",js);
		return this;
	}

	/**
	* adds assets and javascript to page, return div to fill with tweets
	* @settings struct of settings, will override default and stored settings
	*/
	any function renderIt(settings={}){
		var rString = '<div class="tweet"></div>';
		//combine the passed in settings with the defaults
		var appliedSetting=getAppliedSetting(arguments.settings);
		//add the jquery assets needed
		addAssets(appliedSetting);
		//add the javascript call
		addJS(appliedSetting);
		return rString;
	}

	void function addAssets(settings={}) {
		var assets = arrayNew(1);
		arrayAppend(assets,settings.cssFile);
		arrayAppend(assets,settings.jsFile);
		addAsset(arrayToList(assets));
	}

	void function addJS(settings={}) {
		var JS = '
		<script type="text/javascript">
			$(document).ready(function(){
				$(".tweet").tweet({
					loading_text: "#settings.loadingtext#",
					username: #settings.username#,
					avatar_size: #settings.avatarsize#,
					count: #settings.count#,
					intro_text: "#settings.introtext#",
					outro_text: "#settings.outrotext#",
					join_text: "#settings.jointext#",
					auto_join_text_default: "#settings.autojointextdefault#",
					auto_join_text_ed: "#settings.autojointexted#",
					auto_join_text_ing: "#settings.autojointexting#",
					auto_join_text_reply: "#settings.autojointextreply#",
					auto_join_text_url: "#settings.autojointexturl#",
					query: "#settings.query#"
				});
			})
			</script>';
		$htmlHead(JS);
	}

	private any function getAppliedSetting(settings) {
		var appliedSetting = {};
		var i = 1;
		structAppend(appliedSetting, variables.tfsettings, true);
		structAppend(appliedSetting, arguments.settings, true);
		return appliedSetting;
	}
}
