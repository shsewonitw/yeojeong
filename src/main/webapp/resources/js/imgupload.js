function validate(){
var extensions = new Array("jpg","jpeg","gif","png","bmp");  //이곳에 업로드 가능한 확장자 기재
var image_file = document.form.image_file.value;
var image_length = document.form.image_file.value.length;
var pos = image_file.lastIndexOf('.') + 1;
var ext = image_file.substring(pos, image_length);
var final_ext = ext.toLowerCase();
for (i = 0; i < extensions.length; i++){
	if(extensions[i] == final_ext){
	return true;
	}
}
	alert(extensions.join(', ') +"파일만 등록 가능합니다.");
return false;
}