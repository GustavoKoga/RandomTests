package teste;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.net.ssl.SSLContext;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;

public class TesteHTTPBasicAuthentication {

	public static void main(String[] args) {
		try {

			String encoding = Base64.getEncoder().encodeToString(("fLF0UHo8oDsLWHkXNduiSTmU9MSgOKIl").getBytes());
			HttpPost httppost = new HttpPost("http://homologacao.acrasnfe.acras.com.br/v2/nfse?ref=litoralmedic1");
			httppost.setHeader("Authorization", "Basic " + encoding);

			System.out.println("executing request " + httppost.getRequestLine());
			
			RequestConfig requestConfig = RequestConfig.custom().setConnectionRequestTimeout(10000)
					.setConnectTimeout(60000).setSocketTimeout(120000).build();
			
			final SSLConnectionSocketFactory sslsf;
			try {
			    sslsf = new SSLConnectionSocketFactory(SSLContext.getDefault(),
			            NoopHostnameVerifier.INSTANCE);
			} catch (NoSuchAlgorithmException e) {
			    throw new RuntimeException(e);
			}
			
			CloseableHttpClient client = HttpClientBuilder.create().setDefaultRequestConfig(requestConfig).setSSLSocketFactory(sslsf).build();;
			CloseableHttpResponse response;
			response = client.execute(httppost);
			System.out.println(response);

		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
