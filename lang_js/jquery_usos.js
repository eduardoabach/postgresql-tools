
// Pegar o elemento javascript de um Jquery
var elJs = $('#nome_elemento').get(0);

// Sobe nos elementos html para a tr 
$('#id_exemplo').closest('tr');

// Desativar e Ativar o botão
if ($(this).val() == '') {
    $('.enableOnInput').prop('disabled', true);
} else {
    $('.enableOnInput').prop('disabled', false);
}


$('#id_form').serialize();

//buscas de elementos dentro de outro
var Form = $('#id_form');
Form.find('#campo_a').change(function(){
	alert('alterado');
});

//verificar se um checkbox esta marcado
var campoMarcado = (Form.find('#id_campo_checkbox').attr('checked') == undefined);

div.find('.class-test').each(function(){
	alert($(this).html());
});

// verificar quantidade de registros
if($( "#myDiv" ).length > 5){

}
