import React, { Component } from 'react';
import ManagerData from '../../actions/ManagerData.js';
import { exportColumeData } from '../../config/table/ManagerToView.js';
import {
  FormControl,
  Button,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from '@material-ui/core';
//import { CKEditor } from '@ckeditor/ckeditor5-react';
//import ClassicEditor from '@ckeditor/ckeditor5-build-classic';
//https://www.programmersought.com/article/96678994232/
import PublishIcon from '@material-ui/icons/Publish';
import Swal from 'sweetalert2';
import {
  uploadfileDataImage,
  updateExamToWriter,
  registerExamToWriter
} from '../../api/httpBaseUtil.js';
import UploadImage from '../../compoment/form/UploadImage.js';
import SelectExam from '../../compoment/form/SelectExam.js';
import SearchExamDetail from '../../compoment/form/SearchExamDetail.js';
import '../../config/config.js';
import PropTypes from 'prop-types';
import { CKEditor } from '@ckeditor/ckeditor5-react';
import DecoupledEditor from '@ckeditor/ckeditor5-build-decoupled-document';
import { MyCustomUploadAdapterPlugin } from '../../api/uploadAdatapter.js';
import { providers } from '../../compoment/editor/videoProviders';
//import MediaEmbed from '../../compoment/mediaEmbed/mediaembed';

class RegisterExam extends Component {
  static propTypes = {
    handerClose: PropTypes.func.isRequired,
    is_update: PropTypes.bool.isRequired,
    data: PropTypes.array.isRequired,
    content: PropTypes.string.isRequired,
  };
  constructor(props) {
    super(props);
    this.state = {
      exam_detail_id: this.props.is_update
        ? this.props.data.exam_detail_id
        : 0,
      exam_id: this.props.is_update
        ? this.props.data.exam_id
        : 0,
      refesh: false,
      image_head: this.props.is_update ? this.props.data.content_img : '',
      title: this.props.is_update ? this.props.data.title : '',
      content: this.props.is_update ? this.props.data.content : '',
      is_main: this.props.is_update ? this.props.data.is_main_pages_id : 0,
      content_html: this.props.is_update ? this.props.content : '',
    };
  }
  componentDidMount() {
    ManagerData.getLstDataPromise('exam').then(() => {
      this.setState({ refesh: false });
      console.log('componentDidMount......................');
      setTimeout(() => {
        this.setState({ refesh: true });
      }, 200);
    });
    ManagerData.getLstDataPromise('group_exam').then(() => {
      this.setState({ refesh: false });
      console.log('componentDidMount......................');
      setTimeout(() => {
        this.setState({ refesh: true });
      }, 200);
    });
  }
  handleRowSelectBox = (e) => {
    ManagerData.dialogueCustomizationSave.lstSelect = e;
  };

  handleRowSelection = (e) => {
    ManagerData.dialogueCustomizationSave.dataInput = e.data;
  };

  onChange(content) {
    console.log('Content: ' + content);
    this.setState({ content_html: content });
  }

  saveContentPageToDataBase() {
    var formData = {};
    if (this.props.is_update) {
      formData = this.props.data;
    }
    formData.exam_id = this.state.exam_id;
    formData.content_img = this.state.image_head;
    formData.group_file = 'group_file';
    formData.filesave = 'filesave';
    formData.title = this.state.title;
    formData.content = this.state.content;
    formData.is_main_pages_id = this.state.is_main;
    formData.content_html = this.state.content_html;
    formData.exam_detail_id = this.state.exam_detail_id;
    if (this.props.is_update) {
      updateExamToWriter(formData).then((response) => {
        Swal.fire('Cập nhật thông tin thành công');
        if (!!this.props.handerClose) {
          this.props.handerClose();
        }
      });
    } else {
      registerExamToWriter(formData).then((response) => {
        Swal.fire('Cập nhật thông tin thành công');
      });
    }
  }

  onChangeSub(content, detail) {
    ManagerData.getLstDataPromise('exam_detail', {
      dataFind: {
        exam_id: content.target.value,
        is_main_pages_id: -1,
      },
    }).then(() => {
      this.setState({ refesh: false });
      setTimeout(() => {
        this.setState({ refesh: true });
      }, 200);
    });
    this.setState({ exam_id: content.target.value });
  }

  onChangTitle(content) {
    console.log('Content: ' + content);
    this.setState({ title: content.target.value });
  }

  onChangeContent(content) {
    console.log('Content: ' + content);
    this.setState({ content: content.target.value });
  }

  uploadImage(url) {
    console.log('Content: ' + url);
    this.setState({ image_head: url });
  }
  choiceSubPages = (value) => {
    console.log('Content: ' + value);
    this.setState({ is_main: value });
  };

  render() {
    const custom_config = {
      extraPlugins: [MyCustomUploadAdapterPlugin],
      mediaEmbed: {
        providers: providers,
        previewsInData: true,
      },
    };
    var showEditText = false;

    showEditText = ManagerData.checkDataExistting('exam');
    if (!showEditText)
      showEditText = ManagerData.checkDataExistting('group_exam');

    return (
      <div className="user-data">
        <h2> {this.props.is_update ? 'Sửa bài' : 'Đăng bài'}</h2>
        <br />
        <div className={'row-register'}>
          <div className={'column-register-left'}>
            <UploadImage
              urlImage={this.state.image_head}
              uploadfileDataLink={(url) => {
                this.uploadImage(url);
              }}
            />
          </div>
          <div className={'column-register-right'}>
            {this.state.refesh ? (
              <SelectExam
                detailValue={this.state.exam_id}
                onChange={(event) => {
                  this.onChangeSub(event, 'id');
                }}
              />
            ) : (
              ''
            )}

            <SearchExamDetail
              id_select={this.state.is_main}
              sub_id_select={this.state.exam_id}
              changeID={(value) => {
                this.choiceSubPages(value);
              }}
            />

            <div className={'register-button'}>
              <Button
                variant="outlined"
                component="label"
                disableElevation
                style={{ width: 135, height: 70, color: 'blue' }}
                onClick={() => {
                  this.saveContentPageToDataBase();
                }}
              >
                {this.props.is_update ? 'Sửa bài' : 'Đăng bài'}
              </Button>
            </div>
            <div className={'register-content'}>
              <div className={'register-item'}>
                <p className={'line'}>Tiêu đề bài viết</p>
                <TextField
                  variant="outlined"
                  multiline
                  className={'register-text'}
                  value={this.state.title}
                  onChange={(event) => {
                    this.onChangTitle(event);
                  }}
                />
              </div>
              <div className={'register-item'}>
                <p className={'line'}>Mô tả cụ thể</p>
                <TextField
                  variant="outlined"
                  multiline
                  className={'register-text'}
                  value={this.state.content}
                  onChange={(event) => {
                    this.onChangeContent(event);
                  }}
                />
              </div>
            </div>
          </div>
        </div>
        <div className={'document-editor'}>
          <div id="toolbar-container"></div>

          <CKEditor
            editor={DecoupledEditor}
            data={this.state.content_html}
            config={custom_config}
            onReady={(editor) => {
              const toolbarContainer =
                document.querySelector('#toolbar-container');
              toolbarContainer.appendChild(editor.ui.view.toolbar.element);
              window.editor = editor;
              console.log('Editor is ready to use!', editor);
            }}
            onChange={(event, editor) => {
              const data = editor.getData();
              this.onChange(data);
              console.log({ event, editor, data });
            }}
            onBlur={(event, editor) => {
              console.log('Blur.', editor);
            }}
            onFocus={(event, editor) => {
              console.log('Focus.', editor);
            }}
          />
        </div>
      </div>
    );
  }
}

export default RegisterExam;
