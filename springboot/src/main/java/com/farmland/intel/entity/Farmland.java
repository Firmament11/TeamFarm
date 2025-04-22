package com.farmland.intel.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
 * @since 2023-02-19
 */
@Getter
@Setter
@ApiModel(value = "Farmland对象", description = "")
public class Farmland implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("农田名称")
    private String farm;

    @ApiModelProperty("作物名称")
    private String crop;

    @ApiModelProperty("农田面积")
    private Integer area;

    @ApiModelProperty("农田地址")
    private String address;

    @ApiModelProperty("农田负责人")
    private String keeper;


}
