package com.zikezhi.utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091300505507";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQClO5AXXnSmqXhq5rlQ8Scv3dsl/+QNgcSOTVfdqZF9W2RyRCI0iLrRYsdfWimYMvTiupbom7wxqVaANm1g+F5BfN/PkGdMEZ7jYl1k4jAa676tOYssOlWv9EU1wMeESnwuDLPA/qacP1Q4L46PvMofFXbsvpZ9zfA9A2SJMgoKRReyGvcEpBuOkoK9A7SWdZa69bfMoY9xaQZA33Fqw54xt0VsRtHPiZ2cNWHXZSNzaKWLHTxlBBjO3Vi5/x3bwUIdfitv+8bg3cHsOrQy/vCiYZCfZbyFnN13frumAdhkFytntByd8SZqt24e6SnyPCdINjytp2RmuZwItzV9Z7PNAgMBAAECggEAEkyIZq4lSRfXqC8pMteiOWDellTCkuReOkxCgN/4puNqOmVlTGAgIHRKFDtOA/cQu9NiRxyIOQ/B7q0Ya/bVqXcE6l3Zssj4ycHpCfUq0rBtC44l5Z4IQ1ZQG+Xfsrz1B7yMY8FP/lndH+PUbALCd7LO2uU4kXIvOvKXPcJ27jAOz1QM6Q0Sa0TTll7dKQFfH/dIlJe/SCLGTBxG4KCG31xLvInNaOZph+Mq19w4ScqcOJBxpV+T1kmHd8ZQttjLweWt6j7Ybat1Qr2EA3kCji7e6xNfwYKgXfEPCgpOWNJWF7KLEhjNv4oqBQZmz4uZhqCe6Wn4H3hSsaonpJZxwQKBgQDn8PSoXovpJ41vinkXejwy4PZCwgBNz+zPCuL0FcgDcHowrWjzAO769STPjts9AVinnpyyKjJTQZXZUEZqPcu2hAV1vqXNevMNlQW5lWu46eJVAeoyjvCPKoCu7zVttrapAwrd6jOIaGJzLVIn0fiYDt2J7IrGFS2hfPJovq5kdQKBgQC2XzSwhf+GjEsF9rSIYBFRLlpMD3xd7DAnuxSUlEfhBP0zeQunjBaibi687O/CQbV8J3PVt5EKjCxG3LbHnDZ+dD6o20gx0HDGCjeiDKTaNZb3iw+CLDOcg0KVLPsaN/g2+1F2aIvj1ZximYmcZ7WW57klhr3lTe7xzJFT8xBG+QKBgGhjkjmVE/ND0ew5rnZalW1wwmUZW3mp8zLb+3lPtE2X+eaepXV5HhXk70RbT2ENkhEe2fd19mByTDcaYha+6Uij8rEjtQveIjYitAjqryjyWuNXkUhf/PTydChHkQxoB53ZuLJYDgl+sZCU/Tzey7vkNOE2jN7J+VeNHKz35RVhAoGBAKc/bIyudoYnxu2zMCEZKQhwH/M9CGsCHa9yDA+uZLTh5Gr+CUggWumfblFoYQCfThaL/9jxPZyUrE5YP2+TvQ3/AS/N2cmFRMb5u8drHQvYtZhS+WgBrVtNrRQtaiLDTWju1ehnPFM3JPHvqJm9KnU4ET1u8luGOymY13ZLpJPRAoGBAJPSdqQwA1HnwBrZrBcfL85EpUglFU0gY28q1SFGaurJlEQ868mt2Uv1PvRNXMCQ4dZWN9I3lDT2R00nkiQ1l0JF2YHsYFupYQ/2zYJIn6veZqs6mFRIy6u8HcLq0bhBnSUEpijX/85GWCCM0sXC7lnXhvfn7OC737Re/0YQ8Mlf";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAux+mnEbmCbL0QeBO1p9xdmkPiGUWnfJPMSYyOZtdidisQ1bqhXZPDrEUtN2CdK6xunYrMA2tY/eShHr82P64Y1bhiW8XdKpuM+KVIwHJ+ZngSHPl+3cuPnE3nkk1CG1/tb84bNNSaxQHtIn9hYuTPWO3iH/BW7SoBuSfIuZP9M55qmzhMDmygLay/djtnJJlx94Mb5m7+y47tiLnIKvP6qlIyambF7xtiiIo/ssTGegrAHWeT9M3E5beE958b7BhTja0gZ00HeymNHfMXTDxreU/aR62IAy+bXRMO+EW8NAfHOO0uEaryApJBlVmzWzVYS1EVi6uYxw4Ya2q1ASI8wIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/zikezhi/paynotify";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/zikezhi/payreturn";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	/*public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";*/
	
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	// 支付宝网关
	public static String log_path = "C:\\ailipay\\aa.txt";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
    
    
}

