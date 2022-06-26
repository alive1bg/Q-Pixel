// [ ACTIONS ] \\

MC.AdminMenu.Action.SelectedCat = null;
MC.AdminMenu.Action.Selected = "All";

MC.AdminMenu.SwitchCategory = function(Button, Type) {
    if (MC.AdminMenu.Action.Selected != Type) {
        $('.menu-page-actions-search input').val('');
        $(MC.AdminMenu.Action.SelectedCat).removeClass("active");
        $(Button).addClass("active");
        MC.AdminMenu.Action.SelectedCat = Button
        MC.AdminMenu.Action.Selected = Type
        MC.AdminMenu.LoadItems();
        $('.admin-menu-items').find('.admin-menu-item-arrow').removeClass('closed');
        $('.admin-menu-items').find('.admin-menu-item-arrow').removeClass('open');
    }
}

MC.AdminMenu.LoadItems = async function() {
    $('.admin-menu-items').html('');
    if (MC.AdminMenu.Action.Selected == 'All') {
        $.each(MC.AdminMenu.Items, function(Key, Value) {
            $.each(Value.Items, function(KeyAdmin, ValueAdmin) {
                MC.AdminMenu.BuildItems(ValueAdmin);
            });
        });
    } else {
        $.each(MC.AdminMenu.Items, function(Key, Value) {
            if (Value.Name == MC.AdminMenu.Action.Selected) {
                $.each(Value.Items, function(KeyAdmin, ValueAdmin) {
                    MC.AdminMenu.BuildItems(ValueAdmin);
                });
            }
        });
    }
}

MC.AdminMenu.ConvertPlayerList = () => {
    let Options = [];
    for (let i = 0; i < MC.AdminMenu.Players.length; i++) {
        const Player = MC.AdminMenu.Players[i];
        Options.push({
            Icon: false,
            Text: `[${Player.ServerId}] ${Player.Name} (${Player.Steam})`,
            Source: Player.ServerId,
        })
    }
    return Options;
}

MC.AdminMenu.BuildItems = function(Item) {
    let CollapseOptions = ``;

        if (Item.Options != undefined && Item.Options.length > 0) {
            CollapseOptions += `<div class="admin-menu-item-options">`

            for (let i = 0; i < Item.Options.length; i++) {
                const Option = Item.Options[i];

                let DOMElement = `<div id="${Option.Id}" class="ui-styles-input">
                    <input type="text" class="ui-input-field">
                    <div class="ui-input-label">${Option.Name || 'No Label Given?'}</div>
                </div>`;

                if (Option.Type.toLowerCase() == 'input-choice' || Option.Type.toLowerCase() == 'text-choice') {
                    if (Option.PlayerList) Option.Choices = MC.AdminMenu.ConvertPlayerList();
                    if (Item.Id == 'unbanPlayer') Option.Choices = MC.AdminMenu.Bans;

                    AdminOpenInputChoice = function(Element){
                        let Input = $(Element).find("input");
                        let SelectedItem = JSON.parse($(Element).attr("Item"));
                        let Choice = Number($(Element).attr("ChoiceId"));
    
                        if (Option.Choices[0].Callback == undefined) {
                            for (let ChoiceId = 0; ChoiceId < SelectedItem.Options[Choice].Choices.length; ChoiceId++) {
                                SelectedItem.Options[Choice].Choices[ChoiceId].Callback = () => {
                                    Input.val(SelectedItem.Options[Choice].Choices[ChoiceId].Text);
                                    if (SelectedItem.Options[Choice].Choices[ChoiceId].Source) {
                                        MC.AdminMenu.CurrentTarget = SelectedItem.Options[Choice].Choices[ChoiceId]
                                        if (MC.AdminMenu.CurrentTarget != null) {
                                            $('.admin-menu-items').animate({
                                                'max-height': 70+'vh',
                                            }, 100);
                                            $('.menu-current-target').fadeIn(150);
                                            $('.menu-current-target').html(`Current Target: ${MC.AdminMenu.CurrentTarget.Text}`)
                                        } else {
                                            $('.menu-current-target').fadeOut(150);
                                        }
                                        Input.data("PlayerId", SelectedItem.Options[Choice].Choices[ChoiceId].Source)
                                    } else if (SelectedItem.Options[Choice].Choices[ChoiceId].BanId) {
                                        Input.val(SelectedItem.Options[Choice].Choices[ChoiceId].BanId);
                                        Input.data("BanId", SelectedItem.Options[Choice].Choices[ChoiceId].BanId)
                                    };
                                };
                            };
                        };
                        
                        if (SelectedItem.Options[Choice].Type.toLowerCase() == 'text-choice') {
                            MC.AdminMenu.BuildDropdown(SelectedItem.Options[Choice].Choices, undefined, false)
                            Input.focus();
                        } else {
                            MC.AdminMenu.BuildDropdown(SelectedItem.Options[Choice].Choices, undefined, true)
                        }
                    };

                    DOMElement = `<div id="${Option.Id}" Item='${JSON.stringify(Item)}' ChoiceId="${i}" onclick="AdminOpenInputChoice(this)" class="ui-styles-input">
                        <input type="text" class="ui-input-field" ${Option.Type.toLowerCase() == 'input-choice' ? 'readonly' : ''}>
                        <div class="ui-input-label">${Option.Name || 'No Label Given?'}</div>
                    </div>`;
            }
            CollapseOptions += `<div class="admin-menu-items-option-input">${DOMElement}</div>`;
        }
        CollapseOptions += `<div class="admin-menu-execute ui-styles-button default">${Item.Name}</div></div>`
    }

    let AdminOption = `<div class="admin-menu-item ${MC.AdminMenu.EnabledItems[Item['Id']] ? 'enabled' : ''}" id="admin-option-${Item['Id']}">
        <div class="admin-menu-item-favorited ${MC.AdminMenu.FavoritedItems[Item['Id']] ? 'favorited' : ''}"><i class="${MC.AdminMenu.FavoritedItems[Item['Id']] ? 'fa-solid' : 'fa-regular'} fa-star"></i></div>
        <div class="admin-menu-item-arrow">${CollapseOptions != "" ? `<i class="fa-solid fa-chevron-down">` : ""}</i></div>
        <div class="admin-menu-item-name">${Item.Name}</div>
        ${CollapseOptions}
    </div>`;

    if (MC.AdminMenu.FavoritedItems[Item['Id']]) {
        $('.admin-menu-items').prepend(AdminOption);
    } else {
        $('.admin-menu-items').append(AdminOption);
    }
    $(`#admin-option-${Item['Id']}`).data('MenuData', Item);
};

// Dropdown

MC.AdminMenu.ClearDropdown = function() {
    if ($('.ui-styles-dropdown').length != 0) {
        $('.ui-styles-dropdown').remove();
    }
};

MC.AdminMenu.BuildDropdown = (Options, CursorPos, HasSearch) => {
    if (Options.length == 0) return;

    MC.AdminMenu.IsGeneratingDropdown = true;

    $('.ui-styles-dropdown').remove();
    let DropdownDOM = ``;

    if (HasSearch) DropdownDOM += `<div class="ui-styles-dropdown-item ui-styles-dropdown-search"><input type="text" placeholder="Search.."></div>`;
    for (let i = 0; i < Options.length; i++) {
        const Elem = Options[i];
        
        OnDropdownButtonClick = (Element) => {
            let DropdownOption = Options[Number(Element.getAttribute("DropdownId"))];
            DropdownOption.Callback(DropdownOption);
            $('.ui-styles-dropdown').remove();
        };

        DropdownDOM += `<div DropdownId=${i} onclick="OnDropdownButtonClick(this)" class="ui-styles-dropdown-item">${Elem.Icon ? `<i class="${Elem.Icon}"></i> ` : ''}${Elem.Text}${Elem.Label != null ? Elem.Label : ""}</div>`;
    };

    $('body').append(`<div class="ui-styles-dropdown">${DropdownDOM}</div>`);

    if (HasSearch) {
        $('.ui-styles-dropdown-search input').focus();
    }

    let top = CursorPos != undefined && CursorPos.y || window.event.clientY;
    let left = CursorPos != undefined && CursorPos.x || window.event.clientX;

    let DropdownHeight = Number($('.ui-styles-dropdown').css('height').replace('px', ''));
    let DropdownWidth = Number($('.ui-styles-dropdown').css('width').replace('px', ''));

    if (top + DropdownHeight >= screen.height) top = screen.height - DropdownHeight;
    if (left + DropdownWidth >= screen.width) left = screen.width - (DropdownWidth + 10);

    $('.ui-styles-dropdown').css({
        top: top,
        left: left,
    })

    setTimeout(() => {
        MC.AdminMenu.IsGeneratingDropdown = false;
    }, 250);
};

// [ SEARCH ] \\

$(document).on('input', '.menu-page-actions-search input', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.admin-menu-item').each(function(Elem, Obj){
        if ($(this).find('.admin-menu-item-name').html().toLowerCase().includes(SearchText)) {
            $(this).fadeIn(150);
        } else {
            $(this).fadeOut(150);
        };
    });
});

$(document).on('input', '.ui-styles-dropdown-search input', function(e){
    let SearchText = $(this).val().toLowerCase();

    $('.ui-styles-dropdown-item').each(function(Elem, Obj){
        if (!$(this).hasClass("ui-styles-dropdown-search")) {
            if ($(this).html().toLowerCase().includes(SearchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        }
    });
});

// [ CLICKS ] \\


$(document).on('click', '.menu-page-action-header-category', function(e) {
    e.preventDefault();
    let Type = $(this).attr('data-Type');
    MC.AdminMenu.SwitchCategory($(this), Type)
});

$(document).on('click', '.admin-menu-item', function(e) {
    e.preventDefault();
    let Data = $(this).data('MenuData');
    if ($(this).find('.admin-menu-item-favorited:hover').length != 0) return;

    if (Data != undefined && !Data.Collapse) {
        $.post(`https://${GetParentResourceName()}/Admin/TriggerAction`, JSON.stringify({Event: Data.Event, EventType: Data.EventType, Result: []}));
    } else if (Data && Data.Collapse) {
        let OptionsDom = $(this).find('.admin-menu-item-options');

        if (OptionsDom.hasClass('extended')) {
            if (!$(e.target).hasClass('admin-menu-item-name')) return;
            OptionsDom.hide();
            OptionsDom.removeClass('extended');
            $(this).find('.admin-menu-item-arrow').removeClass('open');
            $(this).find('.admin-menu-item-arrow').addClass('closed');
        } else {
            OptionsDom.show();
            OptionsDom.addClass('extended');
            $(this).find('.admin-menu-item-arrow').removeClass('closed');
            $(this).find('.admin-menu-item-arrow').addClass('open');
            
            if (MC.AdminMenu.CurrentTarget != null) {
                if ($(this).find('.admin-menu-items-option-input').first().find('.ui-input-label').text() == 'Player') {
                    $(this).find('.admin-menu-items-option-input input').first().data("PlayerId", MC.AdminMenu.CurrentTarget.Source)
                    $(this).find('.admin-menu-items-option-input input').first().val(MC.AdminMenu.CurrentTarget.Text);
                }
            }
        }
    }
});

$(document).on('click', '.admin-menu-item-favorited', function(e) {
    e.preventDefault();
    let Data = $(this).parent().data('MenuData');
    if ($(this).hasClass("favorited")) {
        $(this).removeClass('favorited');
        $(this).html('<i class="fa-regular fa-star"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/ToggleFavorite`, JSON.stringify({ Id: Data.Id, Toggle: false }))
    } else {
        $(this).addClass('favorited');
        $(this).html('<i class="fa-solid fa-star"></i>')
        $.post(`https://${GetParentResourceName()}/Admin/ToggleFavorite`, JSON.stringify({ Id: Data.Id, Toggle: true }))
    }
});

$(document).on('click', '.admin-menu-execute', function(e){
    e.preventDefault();
    let Data = $(this).parent().parent().data('MenuData');
    let Result = {};
    
    $(this).parent().find('.ui-styles-input').each(function(Elem, Obj){
        if ($(this).find('input').data("PlayerId")) {
            Result[$(this).attr("id")] = Number($(this).find('input').data("PlayerId"));
        } else if ($(this).find('input').data("BanId")) {
            Result[$(this).attr("id")] = $(this).find('input').data("BanId");
        } else {
            Result[$(this).attr("id")] = $(this).find('input').val();
        };
    });
    $.post(`https://${GetParentResourceName()}/Admin/TriggerAction`, JSON.stringify({
        Event: Data.Event,
        EventType: Data.EventType,
        Result: Result,
    }));
});

$(document).on('click', 'body', function(e){
    if (MC.AdminMenu.IsGeneratingDropdown) return;
    if ($('.ui-styles-dropdown').length != 0 && $('.ui-styles-dropdown-search:hover').length == 0) $('.ui-styles-dropdown').remove();
});