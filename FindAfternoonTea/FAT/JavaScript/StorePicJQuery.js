$("#insertButton").click(function () {
    $("#InsertBlock").toggle(1000);
    if ($("#insertButton").val() == "新增圖片") {
        $("#insertButton").val("取消新增");
    }
    else $("#insertButton").val("新增圖片");
});

$("#storeButton").click(function () {
    window.location.href = 'StoreManage.aspx';
});

$("#storePicButton").click(function () {
    window.location.href = 'StorePicManage.aspx';
});

$("#addButton").click(function () {
    var count = $(".fieldname").length+1;
    $('#picsUP').append("<tr><td><input type=\"button\" class=\"remove\" value=\"-\" /></td><td><input type=\"text\" class=\"fieldname\" id=\"field" + count + "\" /></td></tr>");
    $(".remove").click(function () {
        $(this).closest('tr').remove();
        var wrappers = $(".fieldname");
        if (wrappers.length > 1) {
            var newId = 1;
            wrappers.each(function () {
                renewId = "filed" + newId;
                $(this).attr("id", renewId);
                newId++;
            });
        }
        var arrText = $('input[type=text]').map(function () {
            return this.value;
        }).get().join();
        $("#pathHiddenField").val(arrText);
    });
    $(".fieldname").change(function () {
        var arrText = $('input[type=text]').map(function () {
            return this.value;
        }).get().join();
        $("#pathHiddenField").val(arrText);
    })
    
   count++;
});

$(".fieldname").change(function () {
    var arrText = $('input[type=text]').map(function () {
        return this.value;
    }).get().join();
    $("#pathHiddenField").val(arrText);
})