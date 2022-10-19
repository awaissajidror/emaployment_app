import {Controller} from '@hotwired/stimulus'

// Connects to data-controller="remote-modal"
export default class extends Controller {
    connect() {
        $('#shared_modal').show();
        $('#FirstName').keyup(function (e) {
            const input = $('#FirstName').val();
            if (input.length >= 25) {
                $('.FirstNameError').removeClass('hidden');
                e.preventDefault();
            } else if (input.length < 25) {
                $('.FirstNameError').addClass('hidden');
            }
        })

        $('#LastName').keyup(function (e) {
            const input = $('#LastName').val();
            if (input.length >= 50) {
                $('.LastNameError').removeClass('hidden');
                e.preventDefault();
            } else if (input.length <= 50) {
                $('.FirstNameError').addClass('hidden');
            }
        });

        $('#EmailAddress').keyup(function () {
            const $email = this.value;
            validateEmail($email);
        });

        function validateEmail(email) {
            const emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
            if (!emailReg.test(email)) {
                $('.EmailError').show();
                $('#PhoneNumber').attr('disabled', 'disabled');
            } else {
                $('.EmailError').hide();
                $('#PhoneNumber').removeAttr('disabled');
            }
        }

        $('#PhoneNumber').keyup(function () {
            $(this).val($(this).val().replace(/(\d{3})\-?(\d{3})\-?(\d{4})/, '$1-$2-$3'))
        });
    }

    hideBeforeRender(event) {
        if (this.isOpen()) {
            event.preventDefault();
            this.element.addEventListener('hidden', event.detail.resume)
        }
    }

    isOpen() {
        return this.element.classList.contains('block')
    }

    addNewEmploymentForm() {
        $('#employmentPatentDiv').clone().appendTo('#CloneContainer');
    }

    closeModal(){
        $('#remote_modal').hide();
        $('#topTurboFrame').html('<turbo-frame id="remote_modal" target="_top"></turbo-frame>');
    }
}
