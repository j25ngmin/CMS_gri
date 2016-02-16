/* 기존 소스 보존 */
/**
 * Convert a single file-input element into a 'multiple' input list
 * Usage:
 *
 *   1. Create a file input element (no name)
 *      eg. <input type="file" id="first_file_element">
 *
 *   2. Create a DIV for the output to be written to
 *      eg. <div id="files_list"></div>
 *
 *   3. Instantiate a MultiSelector object, passing in the DIV and an (optional) maximum number of files
 *      eg. var multi_selector = new MultiSelector( document.getElementById( 'files_list' ), 3 );
 *
 *   4. Add the first element
 *      eg. multi_selector.addElement( document.getElementById( 'first_file_element' ) );
 *//*

function MultiSelector( list_target, max ){

	// Where to write the list
	this.list_target = list_target;
	// How many elements?
	this.count = 0;
	// How many elements?
	this.id = 0;
	// Is there a maximum?
	if( max ){
		this.max = max;
	} else {
		this.max = -1;
	};
	
	*//**
	 * Add a new file input element
	 *//*
	this.addElement = function( element ){

		// Make sure it's a file input element
		if( element.tagName == 'INPUT' && element.type == 'file' ){

			// Element name -- what number am I?
			element.name = 'file_' + this.id++;

			// Add reference to this object
			element.multi_selector = this;

			// What to do when a file is selected
			element.onchange = function(){

				// New file input
				var new_element = document.createElement( 'input' );
				new_element.type = 'file';

				// Add new element
				this.parentNode.insertBefore( new_element, this );

				// Apply 'update' to element
				this.multi_selector.addElement( new_element );

				// Update list
				this.multi_selector.addListRow( this );
				
				// Hide this: we can't use display:none because Safari doesn't like it
				this.style.position = 'absolute';
				this.style.left = '-1000px';
				this.style.top = '-1000px';
				this.style.display = 'none';
				this.style.visibility = 'hidden';
				this.style.width = '0';
				this.style.height = '0';
				this.style.overflow = 'hidden';

				new_element.onkeypress = function(){
					return false;
				};

			};
			// If we've reached maximum number, disable input element
			if( this.max != -1 && this.count >= this.max ){
				element.disabled = true;
			};

			// File element counter
			this.count++;
			// Most recent element
			this.current_element = element;
			
		} else {
			// This can only be applied to file input elements!
			alert( 'Error: not a file input element' );
		};

	};

	*//**
	 * Add a new row to the list of files
	 *//*
	this.addListRow = function( element ){

		// Row div
		var new_row = document.createElement( 'div' );

		// Delete button
		var new_row_button = document.createElement( 'input' );
		new_row_button.type = 'button';
		new_row_button.value = 'Delete';

		// References
		new_row.element = element;

		// Delete function
		new_row_button.onclick= function(){

			// Remove element from form
			this.parentNode.element.parentNode.removeChild( this.parentNode.element );

			// Remove this row from the list
			this.parentNode.parentNode.removeChild( this.parentNode );

			// Decrement counter
			this.parentNode.element.multi_selector.count--;

			// Re-enable input element (if it's disabled)
			this.parentNode.element.multi_selector.current_element.disabled = false;

			//    which nixes your already queued uploads
			return false;
		};

		// Set row value
		new_row.innerHTML = element.value;

		// Add button
		new_row.appendChild( new_row_button );

		// Add it to the list
		this.list_target.appendChild( new_row );
	};

};*/

/* Ajax를 이용한 다중파일 */

$(function() {

	var url  = '/CMS_gri/cms/ajax/fileStorage.do'

    // Setup html5 version
    $("#html5_uploader").pluploadQueue({
        // General settings
        runtimes : 'html5',
        url :url,
        chunk_size : '10mb',
        unique_names : true,
        
        // Resize images on clientside if we can
        resize : {width : 320, height : 240, quality : 90}
    });
});

var totalFileLength, totalUploaded, fileCount, filesUploaded;

function debug(s) {
    var debug = document.getElementById('debug');
    if (debug) {
        debug.innerHTML = debug.innerHTML + '<br/>' + s;
    }
}

function onUploadComplete(e) {
    totalUploaded += document.getElementById('files').
            files[filesUploaded].size;
    filesUploaded++;
    debug('완료 ' + filesUploaded + " / " + fileCount);
    debug('업료드한 용량: ' + totalUploaded);       
    if (filesUploaded < fileCount) {
        uploadNext();
    } else {
        alert('업로드 완료!');
    }
}
 
function onFileSelect(e) {
    var files = e.target.files; // FileList 객체
    var output = [];
    fileCount = files.length;
    totalFileLength = 0;
    for (var i=0; i<fileCount; i++) {
        var file = files[i];
        output.push(file.name, ' (',
              file.size, ' 바이트, ',
              file.lastModifiedDate.toLocaleDateString(), ')'
        );
       
        output.push('<br/>');
        
        debug( file.size+ ' 추가');
        totalFileLength += file.size;
    }
   
    document.getElementById('selectedFiles').innerHTML =
        output.join('');
    debug('전체 크기:' + totalFileLength);
}

function onUploadProgress(e) {
    if (e.lengthComputable) {
        var percentComplete = parseInt(
                (e.loaded + totalUploaded) * 100
                / totalFileLength);
        var bar = document.getElementById('bar');
        bar.style.width = percentComplete + '%';
        bar.innerHTML = percentComplete + ' % 완료';
    } else {
        debug('확인 실패');
    }
}

function onUploadFailed(e) {
    alert("파일 업로드에 실패했습니다.");
}
 
function uploadNext() {
    var xhr = new XMLHttpRequest();
    var fd = new FormData();
    var file = document.getElementById('files').
            files[filesUploaded];
    fd.append("fileToUpload", file);
    xhr.upload.addEventListener(
            "progress", onUploadProgress, false);
    xhr.addEventListener("load", onUploadComplete, false);
    xhr.addEventListener("error", onUploadFailed, false);
    xhr.open("POST", "fileupload");
    debug(file.name+ ' 업로드 중');
    xhr.send(fd);
}

function startUpload() {
    totalUploaded = filesUploaded = 0;
    uploadNext();
}
window.onload = function() {
    document.getElementById('files').addEventListener(
            'change', onFileSelect, false);
    document.getElementById('uploadButton').
            addEventListener('click', startUpload, false);
}

var totalFileLength, totalUploaded, fileCount, filesUploaded;

function debug(s) {
    var debug = document.getElementById('debug');
    if (debug) {
        debug.innerHTML = debug.innerHTML + '<br/>' + s;
    }
}

function onUploadComplete(e) {
    totalUploaded += document.getElementById('files').
            files[filesUploaded].size;
    filesUploaded++;
    debug('완료 ' + filesUploaded + " / " + fileCount);
    debug('업료드한 용량: ' + totalUploaded);       
    if (filesUploaded < fileCount) {
        uploadNext();
    } else {
        alert('업로드 완료!');
    }
}
 
function onFileSelect(e) {
    var files = e.target.files; // FileList 객체
    var output = [];
    fileCount = files.length;
    totalFileLength = 0;
    for (var i=0; i<fileCount; i++) {
        var file = files[i];
        output.push(file.name, ' (',
              file.size, ' 바이트, ',
              file.lastModifiedDate.toLocaleDateString(), ')'
        );
       
        output.push('<br/>');
        
        debug( file.size+ ' 추가');
        totalFileLength += file.size;
    }
   
    document.getElementById('selectedFiles').innerHTML =
        output.join('');
    debug('전체 크기:' + totalFileLength);
}

function onUploadProgress(e) {
    if (e.lengthComputable) {
        var percentComplete = parseInt(
                (e.loaded + totalUploaded) * 100
                / totalFileLength);
        var bar = document.getElementById('bar');
        bar.style.width = percentComplete + '%';
        bar.innerHTML = percentComplete + ' % 완료';
    } else {
        debug('확인 실패');
    }
}

function onUploadFailed(e) {
    alert("파일 업로드에 실패했습니다.");
}
 
function uploadNext() {
    var xhr = new XMLHttpRequest();
    var fd = new FormData();
    var file = document.getElementById('files').
            files[filesUploaded];
    fd.append("fileToUpload", file);
    xhr.upload.addEventListener(
            "progress", onUploadProgress, false);
    xhr.addEventListener("load", onUploadComplete, false);
    xhr.addEventListener("error", onUploadFailed, false);
    xhr.open("POST", "fileupload");
    debug(file.name+ ' 업로드 중');
    xhr.send(fd);
}

function startUpload() {
    totalUploaded = filesUploaded = 0;
    uploadNext();
}
window.onload = function() {
    document.getElementById('files').addEventListener(
            'change', onFileSelect, false);
    document.getElementById('uploadButton').
            addEventListener('click', startUpload, false);
}
