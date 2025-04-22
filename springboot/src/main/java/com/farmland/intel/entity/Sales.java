package com.farmland.intel.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2023-02-20
 */
@Getter
@Setter
@ApiModel(value = "Sales对象", description = "")
public class Sales implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("产品")
    private String product;

    @ApiModelProperty("价格（元）")
    private BigDecimal price;

    @ApiModelProperty("采购数量")
    private Integer number;

    @ApiModelProperty("采购商")
    private String buyer;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("电话")
    private String phone;

    @ApiModelProperty("出货人")
    private String shipper;

    @ApiModelProperty("备注")
    private String remark;


}
