var form = document.querySelector('#register');

form.addEventListener('submitted',
    function(event) {
        if (event.detail.status > 299) {
            // submit has failed
        }
        else {
            alert("success");
        }
    }
);
