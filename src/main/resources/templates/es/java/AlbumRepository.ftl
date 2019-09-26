package ${base.basePackageName}.service;

import ${base.basePackageName}.model.bo.AlbumEntity;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AlbumRepository extends ElasticsearchRepository<AlbumEntity, Long> {



}
