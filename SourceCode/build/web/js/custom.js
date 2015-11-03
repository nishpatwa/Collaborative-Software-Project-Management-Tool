var checkMandatoryFields = function (ctx) {
    ctx = ctx ? (typeof ctx === "string" ? $(ctx) : ctx) : document;
    var flag = true, msg = {
        mandatory: 'This field is mandatory, please fill up this field to proceed.',
        email: 'You\'ve entered an invalid email address, please verify this field.',
        url: 'You\'ve entered an invalid web address, please verify this field.',
        number: 'You\'ve entered an invalid number, please enter numeric values.',
        minmax: 'You\'ve entered an invalid number. You can enter values ranges from {0} to {1}'
    };
    $('.req', ctx).removeClass('req');
    $('.mandatory', ctx).filter(':enabled').each(function () {
        switch (this.nodeName) {
            case "INPUT":
            case "TEXTAREA":
                if (this.value.trim() == '') {
                    $(this).addClass('req').data('msg', msg.mandatory);
                    flag = false;
                }
                else if (this.className.indexOf("email") > -1 && !validateEmail(this.value)) {
                    $(this).addClass('req').data('msg', msg.email);
                    flag = false;
                }
                else if (this.className.indexOf("url") > -1 && !validateURL(this.value)) {
                    $(this).addClass('req').data('msg', msg.url);
                    flag = false;
                }
                break;

            case "SELECT":
                if (this.options[this.selectedIndex] == undefined || this.value == '0'
					|| (this.value.toUpperCase().indexOf('SELECT ') > -1)
                    || (this.value == '' && $(this.options[this.selectedIndex]).text().toUpperCase().indexOf('ALL ') === -1)
                    || (this.value == "-1" && $(this.options[this.selectedIndex]).text().toUpperCase().indexOf('PLEASE ') > -1)) {
                    $(this).addClass('req').data('msg', msg.mandatory);
                    flag = false;
                }
                break;

            case "DIV":
                var $this = $(this);
                if ($this.hasClass('checkboxlist')) {
                    if ($this.bindCheckBoxList('getSelection') == '') {
                        $this.addClass('req').find(':input:visible:enabled:first').data('msg', msg.mandatory);
                        flag = false;
                    }
                }
                //else if ($this.jqxDropDownList('getSelectedItem') == null || $this.jqxDropDownList('getSelectedItem').value == "-1") {
                //    $this.addClass('req');
                //    flag = false;
                //}

                break;

            case "TABLE":
                var $this = $(this);
                if ($this.hasClass('CheckBoxList')) {
                    if ($this.find('input:checked').length === 0) {
                        $this.addClass('req').find(':input:visible:enabled:first').data('msg', msg.mandatory);
                        flag = false;
                    }
                }
                break;
        }
    });

    $('.numeric:not(.req)').each(function () {
        if (this.value.trim() != '') {
            if (isNaN(this.value)) {
                $(this).addClass('req').data('msg', msg.number);
                flag = false;
                return true;
            }
            var max = $($(this).attr('data-max')).val() || this.max,
                min = $($(this).attr('data-min')).val() || this.min;
            if (((max && +this.value > +max) || (min && +this.value < +min))) {
                $(this).addClass('req').data('msg', String.format(msg.minmax, min, max));
                flag = false;
                return true;
            }
        }
    });

    $('.email').each(function () {
        if (this.value.trim() != '' && !validateEmail(this.value)) {
            $(this).addClass('req').data('msg', msg.email);
            flag = false;
        }
    });

    $('.url').each(function () {
        if (this.value.trim() != '' && !validateURL(this.value)) {
            $(this).addClass('req').data('msg', msg.url);
            flag = false;
        }
    });

    if (!flag) {
        var reqEle = $('.req:first'), prnt = reqEle.parent(), 
			popovr = prnt.hasClass('input-prepend') || prnt.hasClass('input-append') ? prnt
				: reqEle.prop('tagName') == 'SELECT' && $('#s2id_' + reqEle.attr('id')).length ? $('#s2id_' + reqEle.attr('id')) 
				: reqEle;

        //var m = 40, b = $('body'), bt = b.scrollTop() + m, et = reqEle.offset().top;
        //if (bt > et) b.animate({ scrollTop: et - m }, 200);

        prnt.find(':input:visible:enabled:first').focus();
        popovr.popover({
            title: 'Required field',
            content: reqEle.data('msg')
        }).popover('show');
        setTimeout(function () {
            popovr.popover('destroy');
        }, 5000);

    }

    return flag;
};