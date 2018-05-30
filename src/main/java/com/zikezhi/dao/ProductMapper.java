package com.zikezhi.dao;

import java.util.List;
import java.util.Map;

import com.zikezhi.entity.Product;

public interface ProductMapper {
	int deleteByPrimaryKey(String productuuid);

	int insert(Product record);

	int insertSelective(Product record);

	Product selectByPrimaryKey(String productuuid);

	int updateByPrimaryKeySelective(Product record);

	int updateByPrimaryKey(Product record);

	List<Product> list(Map<String, Object> map);
	
	Long getTotal(Map<String, Object> map);
	
	List<Product> serach(String product, int page);
	
	List<Product> selectBySupplierUUid(Map<String, Object> map);

	List<Product> addProductHistory(Map<String, Object> map);

	List<Product> selectByNew(Map<String, Object> map);

	List<Product> selectByTimeDesc(Map<String, Object> map);

	Product findByPid(String productuuid);
	
	
	//添加产品	
	int addNewProduct(Product product);
	
	List<Product> sj_searchProduct(Map<String, Object> map);
	
	long getTotalBySj(Map<String, Object> map);
	
	//删除产品
	int daleteProduct(String productuuid);
	
	List<Product> queryByCart(String uid);
	
	List<Product> queryBySupplier(String supplier);
	
	//供应商删除产品
	int sj_deleCP(String productuuid);
	
	int supplier_updateCp(Product product);
	
	Product supplier_searchCP(Product product);
	
	List<Product> queryAll(Map<String, Object> map);
	
	long getTotalAll(Map<String, Object> map);

	long getStatusSum();
	
	
	//选型指导分类查询
	List<Product> sele_Sort(Map<String, Object> map);
	
	//分类添加查询
	Product sele_SortAdd(String productuuid);
	
	//将分类修改进数据库
	int sort_update(Product product);
	
	//获取上搜索结果总数
	long getTotalSort(Map<String, Object> map);
	
	
	//模块专场
	List<Product> select_module(Map<String, Object> map);
	//模块专场总数
	Long getTotal_Module(Map<String, Object> map);
	//修改页面
	Product select_updateModule(String productuuid);
	
	List<Product> fenleilist(Map<String, Object> map);
	
	Long fenleigetTotal( String product_second);
	
	//后台资料为空
	List<Product> dataNull(Map<String, Object> map);

	
	//代售产品出售信息查看
	Product queryByProduct_booking(String booking_id);
	
	int updateByNumberreduce(Product p);
	Long dataNullTotal(Map<String, Object> map);
	
	//后台查询质量为1和 2
	List<Product> seleQuality(Map<String, Object> map);
	Long seleQualityTotal(Map<String, Object> map);
	
	//随机查找6条产品放到购物车
	List<Product> seleCartRan();
	
	
	//找到封装  筛选
	@SuppressWarnings("rawtypes")
	List seleEncapsulation(Map<String, Object> map);
	
	//找到品牌 筛选
	List seleManufacturer(Map<String, Object> map);
	
	//筛选查询
	List<Product> shaixuanList(Map<String, Object> map);
	
	//筛选查询数量
	Long getshaixuanTotal(Map<String, Object> map);
	
	String selemanum(String manufacturer);
	
	//找到   再次购买产品
	List<Product> goAgain(String eid);
	
	List<Product> seleShelves();
	
	List<Product> seleHot();
	
	List<Product> seleDeal();
	
	List<Product> selechangjian();
	
	List<Product> seleS();
	
	List<Product> seleATM();
	
	List<Product> seleUserSupplierProduct1(String uid);
	
	List<Product> seleUserSupplierProduct2(String uid);
	
	List<Product> seleUserSupplierProduct3(String uid);
	
	List<Product> seleBygengduo(Map<String,Object> map);
	
	List<Product> seleBysuuid(Map<String,Object> map);
	
	List<Product> selePuTong(Map<String,Object> map);
	
	int getputongTatol(Map<String,Object> map);
	
	int queryByproductByMByEbyI(Product product);
	
	List<Product> SupplierProduct(Map<String,Object> map);
	
	int getSupplierProductCount(Map<String,Object> map);
	
	List<Product> queryByGroup(String sid);
	
	List<Product> seleZaiXianProduct(Map<String,Object> map);
	
	int getZaiTotal();
	
	List<Product> selectProductxia(Map<String,Object> map);
	
	int updateEvaluatezai(String pid);
	
	int updateEvaluatecai(String pid);

	Product selepAndlAndmAndeAnd(Product info);
	
	List<Product> seleByOnline(Map<String,Object> map);
	
	int getOnlineTotal(Map<String,Object> map);
	
	int upsuppliername();
	
	//保证无重复添加数据
	int insertNoPepetition(Product p);
	
	//立即购买后更新商品信息
	int updateByProductAfterExpress(Product p);
	
	int queryProductByProduct(Product product);

	List<Product> queryResistice(Map<String, Object> map);

	List<Product> seleZaixianGouByNum(Map<String, Object> map1);

	List<Product> querybdByCart(String userUid);
	
}