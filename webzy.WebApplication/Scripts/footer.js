window.onload = function () {
    addButton();
}
function addButton(){
    var footerBar = document.getElementById("footer");
    var newDivThingy = document.createElement("div");
    newDivThingy.innerHTML = "Hello world";
    newDivThingy.style.color = '#888';
    footerBar.appendChild(newDivThingy);
}
