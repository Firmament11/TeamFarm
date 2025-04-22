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
 * @since 2023-02-22
 */
@Getter
@Setter
@ApiModel(value = "Statistic对象", description = "")
public class Statistic implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("农田名称")
    private String farm;

    @ApiModelProperty("面积")
    private String area;

    @ApiModelProperty("地址")
    private String address;

    @ApiModelProperty("作物名称")
    private String crop;

    @ApiModelProperty("数量")
    private Integer number;

    @ApiModelProperty("生长状态")
    private String state;

    @ApiModelProperty("温度（℃）")
    private BigDecimal temperature;

    @ApiModelProperty("空气湿度（%）")
    private Integer airhumidity;

    @ApiModelProperty("土壤湿度（%）")
    private Integer soilhumidity;

    @ApiModelProperty("CO2含量ppm")
    private Integer carbon;

    @ApiModelProperty("土壤PH值")
    private BigDecimal ph;

    @ApiModelProperty("光照强度(lux)")
    private Integer light;

    @ApiModelProperty("补光灯状态")
    private String filllight;

    @ApiModelProperty("摄像头状态")
    private String monitor;

    @ApiModelProperty("水泵状态")
    private String pump;

    @ApiModelProperty("农田负责人")
    private String keeper;


}
