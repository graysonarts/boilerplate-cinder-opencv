#include "cinder/app/App.h"
#include "cinder/app/RendererGl.h"
#include "cinder/gl/gl.h"
#include "cinder/gl/Texture.h"

#include "CinderOpenCV.h"

#include <memory>

using namespace ci;
using namespace ci::app;
using namespace std;

// We'll create a new Cinder Application by deriving from the App class
class BasicApp : public App
{
public:
    void setup() override;
    void draw() override;
    unique_ptr<cv::VideoCapture> m_capture;
    cv::Mat m_frame;
    gl::TextureRef m_texture;
};

void BasicApp::setup()
{
    m_capture.reset(new cv::VideoCapture(0));
}

void BasicApp::draw()
{
    *m_capture >> m_frame;
    gl::clear( Color( 0.1f, 0.1f, 0.15f ) );
    m_texture = gl::Texture::create( fromOcv(m_frame) );
    gl::draw( m_texture, vec2( 0, 0 ) );
    
}

// This line tells Cinder to actually create the application
CINDER_APP( BasicApp, RendererGl )