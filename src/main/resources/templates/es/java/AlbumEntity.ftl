package ${base.basePackageName}.model.bo;

import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.elasticsearch.annotations.Document;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Data
@Document(indexName = "kkmediadb", type = "album", shards = 5)
public class AlbumEntity implements Serializable {

    @Id
    private Long id;

    private Integer supplierId;

    private String thirdAlbumId;

    private Boolean forgery;

    private String name;

    private String subName;

    private Long channelId;

    private String channelName;

    private String description;

    private Float score;

    private Long playCount;

    private Integer seriesType;

    private Integer contentType;

    private Integer totalEpisode;

    private Integer latestEpisode;

    private Boolean online;

    private Boolean validity;

    private String updateStrategy;

    private Date releaseTime;

    private Integer bootType;

    private Integer bootParamType;

    private String bootParam;

    private Integer downloadType;

    private Integer trialLook;

    private Long trialLookTime;

    private Integer trialLookEpisodes;

    private Date createTime;

    private Date updateTime;

    /**
     * 所有相关人物的名称
     */
    private List<String> persons;

    /**
     * 所有供应商第三级标签
     */
    private List<Long> supplierTagIds;

    /**
     * 所有供应商第三级标签
     */
    private List<String> supplierTags;

    /**
     * 康佳标签id列表
     */
    private List<Long> konkaTagIds;

    /**
     * 康佳标签列表
     */
    private List<String> konkaTags;

    /**
     * 所有属性
     */
    private List<Integer> propertyTypes;

    /**
     * 海报
     */
    private List<PosterEntity> posters;


}
