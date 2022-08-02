// [ OPTIONS ] \\

MC.AdminMenu.LoadOptions = function() {
    DebugMessage('Loading Options.');
    if (MC.AdminMenu.Options != "" && MC.AdminMenu.Options != null) {
        $('.menu-page-options-spinner').fadeIn(450);
        MC.AdminMenu.SetOptions(true)
        setTimeout(() => {
            $('.menu-page-options-spinner').fadeOut(150);
            $('.menu-page-options-items').fadeIn(450);
        }, 1000);
    } else {
        DebugMessage('No options found.');
    }
}

MC.AdminMenu.SetOptions = function(FirstLoad) {
    DebugMessage('Setting Options.');
    $("#LargeDefault input").prop("checked", MC.AdminMenu.Options['LargeDefault']);
    $("#BindOpen input").prop("checked", MC.AdminMenu.Options['BindOpen']);
    $("#Tooltips input").prop("checked", MC.AdminMenu.Options['Tooltips']);
    $("#Resizer input").prop("checked", MC.AdminMenu.Options['Resizer']);
    if (MC.AdminMenu.Options['LargeDefault'] && !FirstLoad) {
        MC.AdminMenu.ChangeSize('Large');
    } else if (!MC.AdminMenu.Options['LargeDefault'] && !FirstLoad) {
        MC.AdminMenu.ChangeSize('Small');
    }
    if (MC.AdminMenu.Options['Tooltips']) {
        MC.AdminMenu.ToggleTooltips(true);
    } else {
        MC.AdminMenu.ToggleTooltips(false);
    }
    if (MC.AdminMenu.Options['Resizer']) {
        $('.menu-size-change').show();
    } else {
        $('.menu-size-change').hide();
    }
}

// [ CLICKS ] \\

$(document).on('change', '.menu-page-options-items .ui-styles-checkbox input', function(e){
    $.post(`https://${GetParentResourceName()}/Admin/ToggleOption`, JSON.stringify({
        Id: $(this).parent().attr("id"),
        Toggle: MC.AdminMenu.IsCheckboxChecked($(this).parent()),
    }));
});