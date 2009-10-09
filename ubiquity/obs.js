CmdUtils.CreateCommand({
  names: ["obs"],
  description: "Ubiquity command for search in wiki.openbravo.com.",
  help: "s <b>some seach string</b>.",
  author: {name: "Iván Perdomo", email: "ivan.perdomo{at}openbravo.com"},
  license: "GPL",
  homepage: "http://katratxo.wordpress.com/",
  arguments: [{role: 'object', nountype: noun_arb_text}],
  preview: function preview(pblock, args) {
    pblock.innerHTML = "Your input is <b>" + args.object.html + "</b>.";
  },
  execute: function execute(args) {
  var query = encodeURIComponent(args.object.text);
    if(query != "") {
      Utils.openUrlInBrowser("http://www.google.com/search?hl=en&q="+query+"+site%3Awiki.openbravo.com")
    }
  }
});
