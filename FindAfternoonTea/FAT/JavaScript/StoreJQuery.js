
window.onload = function () {
    $("#nameTextBox,#priceTextBox,#openTextBox,#phoneTextBox,#addrTextBox").val("");
    $('#closeCheckBoxList input:checked').each(function () {
        $(this).removeAttr("checked");
    });
}
$("#insertButton").click(function () {
    $("#InsertBlock").toggle(1000);
    if ($("#insertButton").val() == "新增餐廳") {
        $("#insertButton").val("取消新增");
    }
    else $("#insertButton").val("新增餐廳");
});

function GetCheckedValue() {
    var selectValues=[];
    $('#closeCheckBoxList input:checked').each(function () {
        if ($(this).is(':checked')) {
            selectValues.push($(this).val());
        }
    });
    return selectValues;
}


$("#closeCheckBoxList").click(function () {
    var closeDay = GetCheckedValue();
    $("#closeHiddenField").val(closeDay);
})

$("#storeButton").click(function () {
    window.location.href = 'StoreManage.aspx';
});

$("#storePicButton").click(function () {
    window.location.href = 'StorePicManage.aspx';
});