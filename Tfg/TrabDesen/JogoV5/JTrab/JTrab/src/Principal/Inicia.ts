window.onload = () => {


    var entidade = new Entidade();
    entidade.id = 100;

    var el = document.getElementById('conteudo');
    el.innerHTML += "ID: ";
    el.innerHTML += entidade.id;
    
};