navigator.getUserMedia_ = navigator.getUserMedia || navigator.webkitGetUserMedia || navigator.mozGetUserMedia || navigator.msGetUserMedia;

function denied() {
    document.body.innerHTML = "sorry but you have denied access";
}

function succes(stream) {
    var video = document.querySelector('video');
    video.src = window.webkitURL.createObjectURL(stream);
}

navigator.getUserMedia_({
    video: true
}, succes, denied);

function captureVideo() {
    var video = document.querySelector('video');
    var canvas = document.getElementById('canvas');
    var ctx = canvas.getContext('2d');
    ctx.drawImage(video, 0, 0, 640, 480);
    var image = document.getElementById("canvas").toDataURL();
    image = image.replace(/^data:image\/(png|jpg);base64,/, "");
    WriteToFile(image);
}

function WriteToFile(image) {
    document.getElementById("postVariable").innerHTML = image;
}