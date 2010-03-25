CmdUtils.CreateCommand({
  name: "obs",
  description: "Ubiquity command for search in wiki.openbravo.com.",
  help: "obs <b>some seach string</b>.",
  author: {name: "Iván Perdomo", email: "ivan.perdomo-at-openbravo.com"},
  license: "GPL",
  homepage: "http://katratxo.wordpress.com/",
  takes: {"input": /.*/},
  preview: function preview(pblock, args) {
    pblock.innerHTML = "Your input is <b>" + args.text + "</b>.";
  },
  execute: function execute(args) {
  var query = encodeURIComponent(args.text);
    if(query != "") {
      Utils.openUrlInBrowser("http://www.google.com/search?hl=en&q="+query+"+site%3Awiki.openbravo.com")
    }
  }
});
