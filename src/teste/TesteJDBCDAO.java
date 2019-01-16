//package teste;
//
//import java.math.BigInteger;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//
//import br.com.pelorus.model.financeiro.Nfe;
//import br.com.pelorus.sped.jdbc.CirurgiaDAO;
//
//public class TesteJDBCDAO {
//	
//	private static Integer idEmpresa = 3550;
//	
//	public static Connection getConnection()
//			throws ClassNotFoundException, SQLException {
//		
//		Class.forName("com.mysql.jdbc.Driver");
//		Connection conn = DriverManager.getConnection(
//					"jdbc:mysql://localhost:3306/v2surgical?autoReconnect=true", 
//					"v2surgical", 
//					"PRrvESu7XsHtX264");
//		return conn;
//		
//	}
//	
//	public static Connection openConnection(Connection conn) {
//		try {
//			/*
//			 * Abrir conexão somente se a atual não existir
//			 * ou estar fechada
//			 */
//			if (conn == null || conn.isClosed()) {
//				conn = getConnection();
//			}
//			
//			
//		} catch (ClassNotFoundException e) {
//			System.out.println("Erro ao encontrar classe.");
//			System.out.println(e);
//		} catch (SQLException e) {
//			System.out.println("Erro ao gerar query.");
//			System.out.println(e);
//		}
//		
//		return conn;
//	}
//	
//	public static void main(String[] args) {
//			
//		Nfe nfe = new Nfe();
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("SELECT * ")
//		.append("FROM nfe ")
//		.append("WHERE nfe.codigo = ? ")
//		;
//		
//		int params = 1;
//		PreparedStatement pst = null;
//		ResultSet rs = null;
//		
//		Connection conn = null;
//		
//		conn = openConnection(conn);
//		
//		try {
//			pst = conn.prepareStatement(sql.toString());
//			
//			pst.setInt(params, 75842);
//			
//			rs = pst.executeQuery();
//			
//			if (rs.next()) {
//				nfe = getObject(rs);
//			}
//			
//		} catch (SQLException e) {
//			System.out.println("Erro ao gerar query. ");
//			System.out.println(e);
//		} finally {
//			try {
//				if (pst != null) {
//					pst.close();
//				}
//				if (conn != null) {
//					conn.close();
//				}
//				if (rs != null) {
//					rs.close();
//				}
//			} catch (SQLException e) {
//				System.out.println("Erro ao fechar conexão. ");
//				System.out.println(e);
//			}
//		}
//		
//		System.out.println(nfe);
//		
//	}
//	
//	public static Nfe getObject(ResultSet rs) throws SQLException {
//		Nfe nfe = new Nfe();
//		
//		try {
//			
//			nfe.setCodigo(rs.getInt("codigo"));
//			nfe.setDataEmissao(rs.getTimestamp("dataEmissao"));
//			nfe.setNumero(BigInteger.valueOf(rs.getInt("numero")));
//			nfe.setSerie(rs.getString("serie"));
//			nfe.setValorCofins(rs.getBigDecimal("valorCofins"));
//			nfe.setValorCsll(rs.getBigDecimal("valorCsll"));
//			nfe.setValorInss(rs.getBigDecimal("valorInss"));
//			nfe.setValorIr(rs.getBigDecimal("valorIr"));
//			nfe.setValorIss(rs.getBigDecimal("valorIss"));
//			nfe.setValorLiquido(rs.getBigDecimal("valorLiquido"));
//			nfe.setValorPis(rs.getBigDecimal("valorPis"));
//			nfe.setValorServicos(rs.getBigDecimal("valorServicos"));
//			
//			nfe.setCancelada(rs.getBoolean("cancelada"));
//			nfe.setChaveDeAcesso(rs.getString("chaveDeAcesso"));
//			nfe.setCorrecao(rs.getString("correcao"));
//			nfe.setDataEntradaSaida(rs.getTimestamp("dataEntradaSaida"));
//			nfe.setJustificativaCancelamento(rs.getString("justificativaCancelamento"));
//			nfe.setValorFrete(rs.getBigDecimal("valorFrete"));
//			Integer cirurgiaId = rs.getInt("cirurgia_id");
//			if (cirurgiaId != null) {
//				CirurgiaDAO daoCirurgia = new CirurgiaDAO(idEmpresa);
//				nfe.setCirurgia(daoCirurgia.getById(cirurgiaId));
//			}
//			nfe.setInformacoesAdicionais(rs.getString("informacoesAdicionais"));
//			nfe.setNaturezaOperacaoManual(rs.getString("naturezaOperacaoManual"));
//			nfe.setNotaReferenciada(rs.getString("notaReferenciada"));
//			nfe.setTextosAdicionais(rs.getString("textosAdicionais"));
//			nfe.setRemessa(rs.getBoolean("remessa"));
//			nfe.setDevolucaoVenda(rs.getBoolean("devolucaoVenda"));
//			nfe.setEstorno(rs.getBoolean("estorno"));
//			nfe.setPesoBruto(rs.getBigDecimal("pesoBruto"));
//			nfe.setPesoLiquido(rs.getBigDecimal("pesoLiquido"));
//			nfe.setVolumes(rs.getInt("volumes"));
//			nfe.setVeiculoPlaca(rs.getString("veiculoPlaca"));
//			nfe.setComEstoque(rs.getBoolean("comEstoque"));
//			nfe.setSaidaQuarentena(rs.getBoolean("saidaQuarentena"));
//			nfe.setVeiculoRntc(rs.getString("veiculoRntc"));
//
//		} catch (SQLException e) {
//			System.out.println("Erro ao montar objeto. ");
//			System.out.println(e);
//		}
//		
//		return nfe;
//	}
//
//}
