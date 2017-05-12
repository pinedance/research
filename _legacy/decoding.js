var items = $('blockquote').map(function() {
  var item = { };
 var that = $(this)
 
  item.title = that.find('p').eq(0).text();
  item.titleEn = that.find('p').eq(1).text();
  item.ref = that.find('p a').eq(0).attr('href');
  item.year = that.find('p a').eq(1).attr('href');
  item.author = that.find('footer').contents().eq(0).text();
  item.jounal = that.find('footer cite').text();
  item.summary = that.find('div p').html();;
  
  return item;
});