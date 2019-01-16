#!/usr/bin/perl
use strict;
use warnings;
use DBI;
use Encode;
require "00-my.lib";

my $dbh = &conecta_db_m02();

my $query;
my $sth;

my $codigoEmpresa;
$codigoEmpresa = 6890;
my $nome = "tagmedic";
my $razaoSocial = "tagmedic";
my $simplesNacional = 1;

if ($codigoEmpresa) {
	
	$query = "INSERT INTO `pessoa` (
		`discriminator`, `codigo`, `cep`, `cnpj`, `email`, 
		`endereco`, `enderecoBairro`, `enderecoComplemento`, `enderecoNumero`, `enderecoTipoLogradouro`, 
		`inscricaoEstadual`, `nome`, `optanteSimplesNacional`, `razaoSocial`, `telefone`, 
		`tipoPessoa`, `cidade_codigo`, `identificador`, `ativo`, `emailNF`, 
		`dataAdesao`
	) VALUES (
		?, ?, ?, ?, ?,
		?, ?, ?, ?, ?,
		?, ?, ?, ?, ?,
		?, ?, ?, ?, ?,
		NOW()
	);";
	
	$sth = $dbh->prepare($query);
	$sth->execute(
		'empresa', $codigoEmpresa, '08730-000', '25.645.419/0001-21', 'gustavo@xbt.com.br', 
		'LOGRADOURO', 'BAIRRO', '', '0', 'RUA', 
		'ISENTO', $nome, getBoolean($simplesNacional), $razaoSocial, '(11) 4566-5453', 
		'JURIDICA', 4717, $nome, getBoolean(1), 'gustavo@xbt.com.br',
	);
	
} else {
	
	$query = "INSERT INTO `pessoa` (
		`discriminator`, `cep`, `cnpj`, `email`, 
		`endereco`, `enderecoBairro`, `enderecoComplemento`, `enderecoNumero`, `enderecoTipoLogradouro`, 
		`inscricaoEstadual`, `nome`, `optanteSimplesNacional`, `razaoSocial`, `telefone`, 
		`tipoPessoa`, `cidade_codigo`, `identificador`, `ativo`, `emailNF`, 
		`dataAdesao`
	) VALUES (
		?, ?, ?, ?,
		?, ?, ?, ?, ?,
		?, ?, ?, ?, ?,
		?, ?, ?, ?, ?,
		NOW()
	);";
	
	$sth = $dbh->prepare($query);
	$sth->execute(
		'empresa', '08730-000', '25.645.419/0001-21', 'gustavo@xbt.com.br', 
		'LOGRADOURO', 'BAIRRO', '', '0', 'RUA', 
		'ISENTO', $nome, getBoolean($simplesNacional), $razaoSocial, '(11) 4566-5453', 
		'JURIDICA', 4717, $nome, getBoolean(1), 'gustavo@xbt.com.br',
	);
	if ($sth->rows) {
		$codigoEmpresa = getUltimoCodigoDB($dbh);
	}
	
}

$query = "INSERT INTO `preferencias` (
	`empresa_codigo`, `tipoAmbienteNfe`, `tipoValidacaoDuplicidadeProduto`, `nfeUsarCfopNatureza`, `apiBoleto`, 
	`apiBoletoSandbox`, `consignacaoLiberaVale`, `permiteCfopsDuplicados`, `nfeUsarTipoLogradouroNoEndereco`, `gerarBoletoAutomatico`, 
	`infNfeAnvisa`, `infNfeAnvisaVencimento`, `infNfeFabricante`, `infNfeLote`, `infNfeLoteVencimento`, 
	`emailGeral`, `clienteFornecedorApelido`, `descontoSobreOrcamento`, `rastreabilidadeApenasComMovimento`, `retornoCaixas`, 
	`serieHomologacao`, `serieProducao`, `usarRepasse`
) VALUES (
	?, ?, ?, ?, ?,
	?, ?, ?, ?, ?,
	?, ?, ?, ?, ?,
	?, ?, ?, ?, ?,
	?, ?, ?
);";

$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa, 'HOMOLOGACAO', 'VALIDA_APENAS_REF', getBoolean(0), 'GERENCIANET',
	getBoolean(0), getBoolean(0), getBoolean(0), getBoolean(0), getBoolean(0),
	getBoolean(1), getBoolean(0), getBoolean(1), getBoolean(1), getBoolean(1),
	'gustavo@xbt.com.br', getBoolean(0), getBoolean(0), getBoolean(0), getBoolean(1),
	'1', '1', getBoolean(0),
);

$query = "INSERT INTO `preferenciasboletobradesco`(
	`empresa_codigo`
) VALUES (
	?
)";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

$query = "INSERT INTO `preferenciasboletocaixa`(
	`empresa_codigo`
) VALUES (
	?
)";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

$query = "INSERT INTO `preferenciasboletoitau`(
	`empresa_codigo`, `codigoBanco`
) VALUES (
	?, 314
)";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

$query = "INSERT INTO `preferenciasboletosicredi`(
	`empresa_codigo`, `codigoComRegistro`, `numeroRemessa`
) VALUES (
	?, 1, 1
)";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoEmpresa,
);

$query = "INSERT INTO `usuario` (
			`discriminator`, `ativo`, `email`, `login`, `nome`, 
			`senha`, `empresa`, `bloqueado`, `falhasLogin`
		) VALUES (
			?, ?, ?, ?, ?,
			?, ?, ?, ?
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	'base', getBoolean(1), $nome, $nome, $nome, 
	'1', $codigoEmpresa, getBoolean(0), '0',
);

my $codigoUsuario = getUltimoCodigoDB($dbh);

$query = "INSERT INTO usuario_permissao (
			usuario, permissao
		) VALUES (
			? , 'ROLE_USUARIO'
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario,
);

$query = "INSERT INTO usuario_permissao (
			usuario, permissao
		) VALUES (
			? , 'ROLE_ADMINISTRADOR'
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario,
);

$query = "INSERT INTO usuario_permissao (
			usuario, permissao
		) VALUES (
			? , 'ROLE_ADMINISTRADOR_GLOBAL'
		);";
$sth = $dbh->prepare($query);
$sth->execute(
	$codigoUsuario,
);

print "Empresa " . $codigoEmpresa . " cadastrada";

exit;