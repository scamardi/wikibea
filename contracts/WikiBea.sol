pragma solidity >=0.4.21 <0.6.0;

// contrato da wiki
contract WikiBea {
  
  // objeto que compõem artigo
  struct artigo {
  	uint id;         // identificador do artigo
  	string titulo;   // titulo do artigo
  	string corpo;    // corpo do artigo
  	address autor;   // autor do artigo
  	uint versao;     // versão do artigo
  }

  // contrutor do artigo / inicialização
  constructor() public {
    // populando os contratos
    adicionaArtigo("titulo teste", "corpo teste");
    adicionaArtigo("titulo teste1", "corpo teste1");
    adicionaArtigo("titulo teste2", "corpo teste2");
    adicionaArtigo("titulo teste3", "corpo teste3");
  } 

  // mapeando o artigo
  mapping(uint => artigo) public artigos;

  // 
  uint public artigosCount;

  // adiciona artigos na blockchain
  function adicionaArtigo (string memory _titulo, string memory _corpo) public {
  	// 
    artigosCount ++;
  	
    artigos[artigosCount] = artigo(artigosCount, _titulo, _corpo, msg.sender, 0);
  }

  function alterarArtigo (uint _id, string memory _titulo, string memory _corpo) public {
  	// verifica se a pessoa que esta tentando alterar é o autor
  	require(artigos[_id].autor == msg.sender);

  	// altera o artigo
  	artigos[_id].titulo = _titulo;
  	artigos[_id].corpo = _corpo;

  	// versiona o artigo
  	artigos[_id].versao ++;
  }

  function getArtigo(uint _id) public view returns (uint, string memory) {
    return (artigos[_id].id, artigos[_id].titulo);
  }

  function getTotalArtigos() public view returns (uint) {
    return artigosCount;
  }

  function getArtigosDoAutor(string memory enderecoAutor) public view returns (uint, string memory) {
    
    for (uint i = 0; i < artigosCount; i++) {
      
    }
  }
}
