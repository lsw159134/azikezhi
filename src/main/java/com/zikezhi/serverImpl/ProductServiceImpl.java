package com.zikezhi.serverImpl;

import com.zikezhi.dao.ProductMapper;
import com.zikezhi.entity.Product;
import com.zikezhi.service.ProductService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 
 * @author ponder
 * @version 1.0
 * @Date 2016年9月2日
 * 
 * @ClassName ProductServiceImpl.java
 * 
 */

@Service("productService")
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductMapper productMapper;

	public List<Product> list(Map<String, Object> map) {
		return productMapper.list(map);
	}

	public Long getTotal(Map<String, Object> map) {
		return productMapper.getTotal(map);
	}

	public List<Product> serach(String product, int page) {
		return productMapper.serach(product, page);
	}

	public int insertProduct(Product product) {
		return productMapper.insert(product);
	}

	public int deleteByPrimaryKey(String productuuid) {
		return productMapper.deleteByPrimaryKey(productuuid);
	}

	public int insertSelective(Product record) {
		return productMapper.insertSelective(record);
	}

	public Product selectByPrimaryKey(String productuuid) {
		return productMapper.selectByPrimaryKey(productuuid);
	}

	public int updateByPrimaryKeySelective(Product record) {
		return productMapper.updateByPrimaryKeySelective(record);
	}

	public int updateByPrimaryKey(Product record) {
		return productMapper.updateByPrimaryKey(record);
	}

	public List<Product> selectBySupplierUUid(Map<String, Object> map) {
		return productMapper.selectBySupplierUUid(map);
	}

	public List<Product> addProductHistory(Map<String, Object> map) {
		return productMapper.addProductHistory(map);
	}

	@Override
	public List<Product> selectByNew(Map<String, Object> map) {
		return productMapper.selectByNew(map);
	}

	@Override
	public List<Product> selectByTimeDesc(Map<String, Object> map) {
		return productMapper.selectByTimeDesc(map);
	}

	@Override
	public Product findByPid(String pid) {
		return productMapper.findByPid(pid);
	}

	// 添加产品
	@Override
	public int addNewProduct(Product product) {
		return productMapper.addNewProduct(product);
	}

	@Override
	public List<Product> sj_searchProduct(Map<String, Object> map) {
		System.out.println(map.get("start"));
		System.out.println(map.get("size"));
		return productMapper.sj_searchProduct(map);
	}

	public int daleteProduct(String productuuid) {
		return productMapper.daleteProduct(productuuid);
	}

	@Override
	public List<Product> queryByCart(String uid) {
		return productMapper.queryByCart(uid);
	}

	@Override
	public long getTotalBySj(Map<String, Object> map) {
		return productMapper.getTotalBySj(map);
	}

	@Override
	public List<Product> queryBySupplier(String supplier) {
		return productMapper.queryBySupplier(supplier);
	}

	@Override
	public int sj_deleCP(String productuuid) {
		return productMapper.sj_deleCP(productuuid);
	}

	@Override
	public int supplier_updateCp(Product product) {
		return productMapper.supplier_updateCp(product);
	}

	@Override
	public Product supplier_searchCP(Product product) {
		return productMapper.supplier_searchCP(product);
	}

	@Override
	public List<Product> queryAll(Map<String, Object> map) {
		return productMapper.queryAll(map);
	}

	@Override
	public long getTotalAll(Map<String, Object> map) {
		return productMapper.getTotalAll(map);
	}

	@Override
	public List<Product> sele_Sort(Map<String, Object> map) {
		return productMapper.sele_Sort(map);
	}

	@Override
	public Product sele_SortAdd(String productuuid) {
		return productMapper.sele_SortAdd(productuuid);
	}

	@Override
	public int sort_update(Product product) {
		return productMapper.sort_update(product);
	}

	@Override
	public long getTotalSort(Map<String, Object> map) {
		return productMapper.getTotalSort(map);
	}

	@Override
	public List<Product> select_module(Map<String, Object> map) {
		return productMapper.select_module(map);
	}

	@Override
	public Long getTotal_Module(Map<String, Object> map) {
		return productMapper.getTotal_Module(map);
	}

	@Override
	public Product select_updateModule(String productuuid) {
		return productMapper.select_updateModule(productuuid);
	}

	@Override
	public List<Product> fenleilist(Map<String, Object> map) {
		return productMapper.fenleilist(map);
	}

	@Override
	public Long fenleigetTotal(String product_second) {
		return productMapper.fenleigetTotal(product_second);
	}

	@Override
	public List<Product> dataNull(Map<String, Object> map) {
		return productMapper.dataNull(map);
	}

	@Override
	public Long dataNullTotal(Map<String, Object> map) {
		return productMapper.dataNullTotal(map);
	}

	@Override
	public List<Product> seleQuality(Map<String, Object> map) {
		return productMapper.seleQuality(map);
	}

	@Override
	public Long seleQualityTotal(Map<String, Object> map) {
		return productMapper.seleQualityTotal(map);
	}

	@Override
	public Product queryByProduct_booking(String booking_id) {
		return productMapper.queryByProduct_booking(booking_id);
	}

	// 减
	@Override
	public int updateByNumberreduce(Product p) {
		return productMapper.updateByNumberreduce(p);
	}

	@Override
	public List<Product> seleCartRan() {
		return productMapper.seleCartRan();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List seleEncapsulation(Map<String, Object> map) {
		return productMapper.seleEncapsulation(map);
	}

	@Override
	public List seleManufacturer(Map<String, Object> map) {
		return productMapper.seleManufacturer(map);
	}

	@Override
	public List<Product> shaixuanList(Map<String, Object> map) {
		return productMapper.shaixuanList(map);
	}

	@Override
	public Long getshaixuanTotal(Map<String, Object> map) {
		return productMapper.getshaixuanTotal(map);
	}

	@Override
	public String selemanum(String manufacturer) {
		return productMapper.selemanum(manufacturer);
	}

	@Override
	public List<Product> goAgain(String eid) {
		return productMapper.goAgain(eid);
	}

	@Override
	public List<Product> seleShelves() {
		return productMapper.seleShelves();
	}

	@Override
	public List<Product> seleHot() {
		return productMapper.seleHot();
	}

	@Override
	public List<Product> seleDeal() {
		return productMapper.seleDeal();
	}

	@Override
	public List<Product> selechangjian() {
		return productMapper.selechangjian();
	}

	@Override
	public List<Product> seleS() {
		return productMapper.seleS();
	}

	@Override
	public List<Product> seleATM() {
		return productMapper.seleATM();
	}

	@Override
	public List<Product> seleUserSupplierProduct1(String uid) {
		return productMapper.seleUserSupplierProduct1(uid);
	}

	@Override
	public List<Product> seleUserSupplierProduct2(String uid) {
		return productMapper.seleUserSupplierProduct2(uid);
	}

	@Override
	public List<Product> seleUserSupplierProduct3(String uid) {
		return productMapper.seleUserSupplierProduct3(uid);
	}

	@Override
	public List<Product> seleBygengduo(Map<String, Object> map) {
		return productMapper.seleBygengduo(map);
	}

	@Override
	public List<Product> seleBysuuid(Map<String, Object> map) {
		return productMapper.seleBysuuid(map);
	}

	@Override
	public List<Product> selePuTong(Map<String, Object> map) {
		return productMapper.selePuTong(map);
	}

	@Override
	public int getputongTatol(Map<String, Object> map) {
		return productMapper.getputongTatol(map);
	}

	@Override
	public int queryByproductByMByEbyI(Product product) {
		return productMapper.queryByproductByMByEbyI(product);
	}

	@Override
	public List<Product> SupplierProduct(Map<String, Object> map) {
		return productMapper.SupplierProduct(map);
	}

	@Override
	public int getSupplierProductCount(Map<String, Object> map) {
		return productMapper.getSupplierProductCount(map);
	}

	@Override
	public List<Product> queryByGroup(String sid) {
		return productMapper.queryByGroup(sid);
	}

	@Override
	public List<Product> seleZaiXianProduct(Map<String, Object> map) {
		return productMapper.seleZaiXianProduct(map);
	}

	@Override
	public int getZaiTotal() {
		return productMapper.getZaiTotal();
	}

	@Override
	public List<Product> selectProductxia(Map<String, Object> map) {
		return productMapper.selectProductxia(map);
	}

	@Override
	public int updateEvaluatezai(String pid) {
		return productMapper.updateEvaluatezai(pid);
	}

	@Override
	public int updateEvaluatecai(String pid) {
		return productMapper.updateEvaluatecai(pid);
	}

	@Override
	public Product selepAndlAndmAndeAnd(Product info) {
		return productMapper.selepAndlAndmAndeAnd(info);
	}

	@Override
	public List<Product> seleByOnline(Map<String, Object> map) {
		return productMapper.seleByOnline(map);
	}

	@Override
	public int getOnlineTotal(Map<String, Object> map) {
		return productMapper.getOnlineTotal(map);
	}

	@Override
	public int upsuppliername() {
		// TODO Auto-generated method stub
		return productMapper.upsuppliername();
	}

	@Override
	public int insertNoPepetition(Product p) {
		return productMapper.insertNoPepetition(p);
	}

	@Override
	public int updateByProductAfterExpress(Product p) {
		return productMapper.updateByProductAfterExpress(p);
	}

	@Override 
	public int queryProductByProduct(Product product){
		return productMapper.queryProductByProduct(product);
	}

	@Override
	public List<Product> seleZaixianGouByNum(Map<String, Object> map1) {
		// TODO Auto-generated method stub
		return productMapper.seleZaixianGouByNum(map1);
	}

	@Override
	public List<Product> querybdByCart(String userUid) {
		// TODO Auto-generated method stub
		return productMapper.querybdByCart(userUid);
	}


}
