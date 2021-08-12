'use strict'


const badgeEl = document.querySelector('header .badges')
const toTopEl = document.querySelector('#to-top')

window.addEventListener('scroll', _.throttle(function () {
  // 페이지 스크롤 위치가 500px이 넘으면.
  if (window.scrollY > 500) {
    // Badge 요소 숨기기!
    gsap.to(badgeEl, .6, {
      opacity: 0,
      display: 'none'
    })
    // 상단으로 스크롤 버튼 보이기!
    gsap.to(toTopEl, .2, {
      x: 0
    })

  // 페이지 스크롤 위치가 500px이 넘지 않으면.
  } else {
    // Badge 요소 보이기!
    gsap.to(badgeEl, .6, {
      opacity: 1,
      display: 'block'
    })
    // 상단으로 스크롤 버튼 숨기기!
    gsap.to(toTopEl, .2, {
      x: 100
    })
  }
}, 300))

toTopEl.addEventListener('click', function () {
  gsap.to(window, .7, {
    scrollTo: 0
  })
})



const fadeEls = document.querySelectorAll('.visual .fade-in')
fadeEls.forEach(function (fadeEl, index) {
  gsap.to(fadeEl, 1, {
    delay: (index + 1) * .7,
    opacity: 1
  })
})



new Swiper('.notice-line .swiper-container', {
  direction: 'vertical', 
  autoplay: true, 
  loop: true 
})
new Swiper('.promotion .swiper-container', {
 
  autoplay: { 
    delay: 5000 // 5초마다 슬라이드 바뀜
  },
  loop: true, 
  slidesPerView: 3, // 한 번에 보여줄 슬라이드 개수
  spaceBetween: 10, // 슬라이드 사이 여백
  centeredSlides: true, 
  pagination: { 
    el: '.promotion .swiper-pagination', 
    clickable: true 
  },
  navigation: { 
    prevEl: '.promotion .swiper-prev',
    nextEl: '.promotion .swiper-next' 
  }
})
new Swiper('.awards .swiper-container', {
  
  autoplay: true, 
  loop: true, 
  spaceBetween: 30,
  slidesPerView: 5, 
  
  navigation: {
    prevEl: '.awards .swiper-prev', 
    nextEl: '.awards .swiper-next' 
  }
})

const promotionEl = document.querySelector('.promotion')

const promotionToggleBtn = document.querySelector('.toggle-promotion')

let isHidePromotion = false

promotionToggleBtn.addEventListener('click', function () {

  isHidePromotion = !isHidePromotion

  if (isHidePromotion) {
    promotionEl.classList.add('hide')

  } else {
    promotionEl.classList.remove('hide')
  }
})



function random(min, max) {
 
  return parseFloat((Math.random() * (max - min) + min).toFixed(2))
}

function floatingObject(selector, delay, size) {
  gsap.to(
    selector, 
    random(1.5, 2.5), 
    {
      delay: random(0, delay), 
      y: size, 
      repeat: -1, 
      yoyo: true, 
      ease: Power1.easeInOut 
    }
  )
}
floatingObject('.floating1', 1, 15)
floatingObject('.floating2', .5, 15)
floatingObject('.floating3', 1.5, 20)

const spyEls = document.querySelectorAll('section.scroll-spy')

spyEls.forEach(function (spyEl) {
  new ScrollMagic
    .Scene({ 
      triggerElement: spyEl, 
      triggerHook: .8 
    })
    .setClassToggle(spyEl, 'show') 
    .addTo(new ScrollMagic.Controller()) 
})


