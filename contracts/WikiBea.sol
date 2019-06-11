pragma solidity >=0.4.21 <0.6.0;

contract WikiBea {
  
  struct artigo {
  	uint id;
  	string titulo;
  	string corpo;
  	address autor;
  	uint versao;
  }

  address public owner;

  constructor() public {
    owner = msg.sender;
    adicionaArtigo("titulo teste", "corpo teste");
    adicionaArtigo("titulo teste1", "corpo teste1");
    adicionaArtigo("titulo teste2", "corpo teste2");
    adicionaArtigo("titulo teste3", "corpo teste3");
  } 

  // mapeando o artigo
  mapping(uint => artigo) public artigos;

  uint public artigosCount;

  // inicialização
  // function WikiBea () public {}

  function adicionaArtigo (string memory _titulo, string memory _corpo) public {
  	artigosCount ++;
  	artigos[artigosCount] = artigo(artigosCount, _titulo, _corpo, msg.sender, 0);
  }

  function alterarArtigo (uint _id, string memory _titulo, string memory _corpo) public {
  	// verifica se a pessoa que esta tentando alterar eh o autor
  	require(artigos[_id].autor == msg.sender);

  	// altera artigo
  	artigos[_id].titulo = _titulo;
  	artigos[_id].corpo = _corpo;

  	// versiona
  	artigos[_id].versao ++;
  }

  function getArtigo(uint _id) public view returns (uint, string memory){
    return (artigos[_id].id, artigos[_id].titulo);
  }

  function getTotalArtigos() public view returns (uint) {
    return artigosCount;
  }
}
