<?php
$title = "Trang Chủ";
require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/includes/client/header.php');
?>
<main>
    <section class="donation-area donation-bg fix pt-90 pb-90" id="banner-home">
        <div class="container custom-container">
            <div class="donation-wrap">
                <div class="row align-items-center">
                    <div class="col-xl-6 col-lg-7">
                        <div class="donation-content">
                            <div class="third-title-style text-center">
                                <h2>HAXALLGAME<span>.PRO</span></h2>
                                <div class="inner">
                                    <p class="text-uppercase" style="color: #c6ff00;"><?=$LOCNGUYEN_SIEUTHICODE->site('content_banner')?></p>
                                </div>
                               
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-5">
                        <div class="donation-img text-center">
                            <img src="/public/img/images/dontaion_img.png" width="100%" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- trending-news-area -->
    <section class="third-about-area third-about-bg pb-90">
        <div class="container custom-container">
            <div class="row align-items-center">

            </div>
            <div id="games-list">
                <!--  -->
                <div class="see-my-info-wrap pt-25">
                    <div class="row">
                        <div class="col-12">
                            <div class="third-section-title text-center mb-25">
                                <h3>DANH SÁCH <span>HACK GAME</span></h3>
                            </div>
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <?php foreach ($LOCNGUYEN_SIEUTHICODE->get_list("SELECT * FROM `tbl_category_hack` WHERE `status` = 1 ORDER BY `stt` ASC") as $cate) : ?>
                        <div class="col-xl-4 col-lg-6 col-md-6 col-sm-10">
                            <div class="my-info-box mb-30">
                                <div class="header-info-box">
                                    <h5><?= $cate['name'] ?></h5>
                                    <div class="liner"></div>
                                </div>
                                <div class="my-info-box-content">
                                    <a href='/cate/<?=$cate['slug']?>' class="mt-award">
                                        <img src="<?= $cate['images'] ?>" alt="">
                                    </a>
                                    <div class="liner"></div>
                                </div>

                                <div class="my-item-info-all">
                                    <p><?= $cate['content'] ?></p>

                                </div>
                                <div class="my-info-box-top">
                                    <a href="/cate/<?=$cate['slug']?>">
                                        <h6>Xem ngay</h6>
                                        <img src="<?= BASE_URL('/assets/frontend/images/my_info_box_hover.png') ?>"
                                            alt="" class="info-box-top-hover">
                                    </a>
                                </div>
                            </div>
                        </div>
                        <?php endforeach; ?>
                    </div>

                </div>
                <!--  -->
            </div>
        </div>
    </section>
</main>
<!-- main-area-end -->
<?php require_once(realpath($_SERVER["DOCUMENT_ROOT"]) . '/includes/client/footer.php');?>