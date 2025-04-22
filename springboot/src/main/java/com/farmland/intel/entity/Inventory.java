package com.farmland.intel.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
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
@ApiModel(value = "Inventory对象", description = "")
public class Inventory implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty("id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("产品")
    private String produce;

    @ApiModelProperty("仓库")
    private String warehouse;

    @ApiModelProperty("存储区")
    private String region;

    @ApiModelProperty("数量")
    private Integer number;

    @ApiModelProperty("仓库管理员")
    private String keeper;

    @ApiModelProperty("备注")
    private String remark;


}
