document.addEventListener('DOMContentLoaded', () => {
  const regex = /〔(.*?)〕/g;
  const elementsToScan = document.querySelectorAll('.item-card-title, .page-detail h1');

  elementsToScan.forEach(el => {
    el.innerHTML = el.innerHTML.replace(regex, '<span class="meta-tag">$1</span>');
  });
});
