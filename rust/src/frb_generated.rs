// This file is automatically generated, so please do not edit it.
// Generated by `flutter_rust_bridge`@ 2.0.0.

#![allow(
    non_camel_case_types,
    unused,
    non_snake_case,
    clippy::needless_return,
    clippy::redundant_closure_call,
    clippy::redundant_closure,
    clippy::useless_conversion,
    clippy::unit_arg,
    clippy::unused_unit,
    clippy::double_parens,
    clippy::let_and_return,
    clippy::too_many_arguments,
    clippy::match_single_binding,
    clippy::clone_on_copy,
    clippy::let_unit_value,
    clippy::deref_addrof,
    clippy::explicit_auto_deref,
    clippy::borrow_deref_ref,
    clippy::needless_borrow
)]

// Section: imports

use flutter_rust_bridge::for_generated::byteorder::{NativeEndian, ReadBytesExt, WriteBytesExt};
use flutter_rust_bridge::for_generated::{transform_result_dco, Lifetimeable, Lockable};
use flutter_rust_bridge::{Handler, IntoIntoDart};

// Section: boilerplate

flutter_rust_bridge::frb_generated_boilerplate!(
    default_stream_sink_codec = SseCodec,
    default_rust_opaque = RustOpaqueMoi,
    default_rust_auto_opaque = RustAutoOpaqueMoi,
);
pub(crate) const FLUTTER_RUST_BRIDGE_CODEGEN_VERSION: &str = "2.0.0";
pub(crate) const FLUTTER_RUST_BRIDGE_CODEGEN_CONTENT_HASH: i32 = 1395064706;

// Section: executor

flutter_rust_bridge::frb_generated_default_handler!();

// Section: wire_funcs

fn wire__crate__api__rustc__rustc_version_impl(
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartSse {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_sync::<flutter_rust_bridge::for_generated::SseCodec, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "rustc_version",
            port: None,
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Sync,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            deserializer.end();
            transform_result_sse::<_, ()>((move || {
                let output_ok = Result::<_, ()>::Ok(crate::api::rustc::rustc_version())?;
                Ok(output_ok)
            })())
        },
    )
}
fn wire__crate__api__yande_client__download_to_file_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "download_to_file",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_url = <String>::sse_decode(&mut deserializer);
            let api_file_path = <String>::sse_decode(&mut deserializer);
            let api_progress_callback =
                decode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
                    <flutter_rust_bridge::DartOpaque>::sse_decode(&mut deserializer),
                );
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, flutter_rust_bridge::for_generated::anyhow::Error>(
                    (move || async move {
                        let output_ok = crate::api::yande_client::download_to_file(
                            api_url,
                            api_file_path,
                            api_progress_callback,
                        )
                        .await?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__yande_client__download_to_memory_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "download_to_memory",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_url = <String>::sse_decode(&mut deserializer);
            let api_progress_callback =
                decode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
                    <flutter_rust_bridge::DartOpaque>::sse_decode(&mut deserializer),
                );
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, flutter_rust_bridge::for_generated::anyhow::Error>(
                    (move || async move {
                        let output_ok = crate::api::yande_client::download_to_memory(
                            api_url,
                            api_progress_callback,
                        )
                        .await?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__yande_client__get_posts_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "get_posts",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_tags = <Vec<String>>::sse_decode(&mut deserializer);
            let api_limit = <u32>::sse_decode(&mut deserializer);
            let api_page = <u32>::sse_decode(&mut deserializer);
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, flutter_rust_bridge::for_generated::anyhow::Error>(
                    (move || async move {
                        let output_ok =
                            crate::api::yande_client::get_posts(api_tags, api_limit, api_page)
                                .await?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}
fn wire__crate__api__yande_client__get_similar_impl(
    port_: flutter_rust_bridge::for_generated::MessagePort,
    ptr_: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len_: i32,
    data_len_: i32,
) {
    FLUTTER_RUST_BRIDGE_HANDLER.wrap_async::<flutter_rust_bridge::for_generated::SseCodec, _, _, _>(
        flutter_rust_bridge::for_generated::TaskInfo {
            debug_name: "get_similar",
            port: Some(port_),
            mode: flutter_rust_bridge::for_generated::FfiCallMode::Normal,
        },
        move || {
            let message = unsafe {
                flutter_rust_bridge::for_generated::Dart2RustMessageSse::from_wire(
                    ptr_,
                    rust_vec_len_,
                    data_len_,
                )
            };
            let mut deserializer =
                flutter_rust_bridge::for_generated::SseDeserializer::new(message);
            let api_post_id = <i64>::sse_decode(&mut deserializer);
            deserializer.end();
            move |context| async move {
                transform_result_sse::<_, flutter_rust_bridge::for_generated::anyhow::Error>(
                    (move || async move {
                        let output_ok = crate::api::yande_client::get_similar(api_post_id).await?;
                        Ok(output_ok)
                    })()
                    .await,
                )
            }
        },
    )
}

// Section: related_funcs

fn decode_DartFn_Inputs_usize_usize_Output_unit_AnyhowException(
    dart_opaque: flutter_rust_bridge::DartOpaque,
) -> impl Fn(usize, usize) -> flutter_rust_bridge::DartFnFuture<()> {
    use flutter_rust_bridge::IntoDart;

    async fn body(dart_opaque: flutter_rust_bridge::DartOpaque, arg0: usize, arg1: usize) -> () {
        let args = vec![
            arg0.into_into_dart().into_dart(),
            arg1.into_into_dart().into_dart(),
        ];
        let message = FLUTTER_RUST_BRIDGE_HANDLER
            .dart_fn_invoke(dart_opaque, args)
            .await;

        let mut deserializer = flutter_rust_bridge::for_generated::SseDeserializer::new(message);
        let action = deserializer.cursor.read_u8().unwrap();
        let ans = match action {
            0 => std::result::Result::Ok(<()>::sse_decode(&mut deserializer)),
            1 => std::result::Result::Err(
                <flutter_rust_bridge::for_generated::anyhow::Error>::sse_decode(&mut deserializer),
            ),
            _ => unreachable!(),
        };
        deserializer.end();
        let ans = ans.expect("Dart throws exception but Rust side assume it is not failable");
        ans
    }

    move |arg0: usize, arg1: usize| {
        flutter_rust_bridge::for_generated::convert_into_dart_fn_future(body(
            dart_opaque.clone(),
            arg0,
            arg1,
        ))
    }
}

// Section: dart2rust

impl SseDecode for flutter_rust_bridge::for_generated::anyhow::Error {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <String>::sse_decode(deserializer);
        return flutter_rust_bridge::for_generated::anyhow::anyhow!("{}", inner);
    }
}

impl SseDecode for flutter_rust_bridge::DartOpaque {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <usize>::sse_decode(deserializer);
        return unsafe { flutter_rust_bridge::for_generated::sse_decode_dart_opaque(inner) };
    }
}

impl SseDecode for String {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut inner = <Vec<u8>>::sse_decode(deserializer);
        return String::from_utf8(inner).unwrap();
    }
}

impl SseDecode for bool {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap() != 0
    }
}

impl SseDecode for i64 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_i64::<NativeEndian>().unwrap()
    }
}

impl SseDecode for Vec<String> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<String>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for Vec<crate::yande::model::post::Post> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<crate::yande::model::post::Post>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for Vec<u8> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut len_ = <i32>::sse_decode(deserializer);
        let mut ans_ = vec![];
        for idx_ in 0..len_ {
            ans_.push(<u8>::sse_decode(deserializer));
        }
        return ans_;
    }
}

impl SseDecode for Option<i64> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        if (<bool>::sse_decode(deserializer)) {
            return Some(<i64>::sse_decode(deserializer));
        } else {
            return None;
        }
    }
}

impl SseDecode for crate::yande::model::post::Post {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut var_id = <i64>::sse_decode(deserializer);
        let mut var_tags = <String>::sse_decode(deserializer);
        let mut var_createdAt = <i64>::sse_decode(deserializer);
        let mut var_updatedAt = <i64>::sse_decode(deserializer);
        let mut var_creatorId = <i64>::sse_decode(deserializer);
        let mut var_author = <String>::sse_decode(deserializer);
        let mut var_change = <i64>::sse_decode(deserializer);
        let mut var_source = <String>::sse_decode(deserializer);
        let mut var_score = <i64>::sse_decode(deserializer);
        let mut var_md5 = <String>::sse_decode(deserializer);
        let mut var_fileSize = <i64>::sse_decode(deserializer);
        let mut var_fileExt = <String>::sse_decode(deserializer);
        let mut var_fileUrl = <String>::sse_decode(deserializer);
        let mut var_isShownInIndex = <bool>::sse_decode(deserializer);
        let mut var_previewUrl = <String>::sse_decode(deserializer);
        let mut var_previewWidth = <i64>::sse_decode(deserializer);
        let mut var_previewHeight = <i64>::sse_decode(deserializer);
        let mut var_actualPreviewWidth = <i64>::sse_decode(deserializer);
        let mut var_actualPreviewHeight = <i64>::sse_decode(deserializer);
        let mut var_sampleUrl = <String>::sse_decode(deserializer);
        let mut var_sampleWidth = <i64>::sse_decode(deserializer);
        let mut var_sampleHeight = <i64>::sse_decode(deserializer);
        let mut var_sampleFileSize = <i64>::sse_decode(deserializer);
        let mut var_jpegUrl = <String>::sse_decode(deserializer);
        let mut var_jpegWidth = <i64>::sse_decode(deserializer);
        let mut var_jpegHeight = <i64>::sse_decode(deserializer);
        let mut var_jpegFileSize = <i64>::sse_decode(deserializer);
        let mut var_rating = <String>::sse_decode(deserializer);
        let mut var_isRatingLocked = <bool>::sse_decode(deserializer);
        let mut var_hasChildren = <bool>::sse_decode(deserializer);
        let mut var_parentId = <Option<i64>>::sse_decode(deserializer);
        let mut var_status = <String>::sse_decode(deserializer);
        let mut var_isPending = <bool>::sse_decode(deserializer);
        let mut var_width = <i64>::sse_decode(deserializer);
        let mut var_height = <i64>::sse_decode(deserializer);
        let mut var_isHeld = <bool>::sse_decode(deserializer);
        let mut var_isNoteLocked = <bool>::sse_decode(deserializer);
        return crate::yande::model::post::Post {
            id: var_id,
            tags: var_tags,
            created_at: var_createdAt,
            updated_at: var_updatedAt,
            creator_id: var_creatorId,
            author: var_author,
            change: var_change,
            source: var_source,
            score: var_score,
            md5: var_md5,
            file_size: var_fileSize,
            file_ext: var_fileExt,
            file_url: var_fileUrl,
            is_shown_in_index: var_isShownInIndex,
            preview_url: var_previewUrl,
            preview_width: var_previewWidth,
            preview_height: var_previewHeight,
            actual_preview_width: var_actualPreviewWidth,
            actual_preview_height: var_actualPreviewHeight,
            sample_url: var_sampleUrl,
            sample_width: var_sampleWidth,
            sample_height: var_sampleHeight,
            sample_file_size: var_sampleFileSize,
            jpeg_url: var_jpegUrl,
            jpeg_width: var_jpegWidth,
            jpeg_height: var_jpegHeight,
            jpeg_file_size: var_jpegFileSize,
            rating: var_rating,
            is_rating_locked: var_isRatingLocked,
            has_children: var_hasChildren,
            parent_id: var_parentId,
            status: var_status,
            is_pending: var_isPending,
            width: var_width,
            height: var_height,
            is_held: var_isHeld,
            is_note_locked: var_isNoteLocked,
        };
    }
}

impl SseDecode for crate::yande::model::similar::Similar {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        let mut var_posts = <Vec<crate::yande::model::post::Post>>::sse_decode(deserializer);
        let mut var_source = <crate::yande::model::post::Post>::sse_decode(deserializer);
        return crate::yande::model::similar::Similar {
            posts: var_posts,
            source: var_source,
        };
    }
}

impl SseDecode for u32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u32::<NativeEndian>().unwrap()
    }
}

impl SseDecode for u8 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u8().unwrap()
    }
}

impl SseDecode for () {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {}
}

impl SseDecode for usize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_u64::<NativeEndian>().unwrap() as _
    }
}

impl SseDecode for i32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_decode(deserializer: &mut flutter_rust_bridge::for_generated::SseDeserializer) -> Self {
        deserializer.cursor.read_i32::<NativeEndian>().unwrap()
    }
}

fn pde_ffi_dispatcher_primary_impl(
    func_id: i32,
    port: flutter_rust_bridge::for_generated::MessagePort,
    ptr: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len: i32,
    data_len: i32,
) {
    // Codec=Pde (Serialization + dispatch), see doc to use other codecs
    match func_id {
        2 => {
            wire__crate__api__yande_client__download_to_file_impl(port, ptr, rust_vec_len, data_len)
        }
        3 => wire__crate__api__yande_client__download_to_memory_impl(
            port,
            ptr,
            rust_vec_len,
            data_len,
        ),
        4 => wire__crate__api__yande_client__get_posts_impl(port, ptr, rust_vec_len, data_len),
        5 => wire__crate__api__yande_client__get_similar_impl(port, ptr, rust_vec_len, data_len),
        _ => unreachable!(),
    }
}

fn pde_ffi_dispatcher_sync_impl(
    func_id: i32,
    ptr: flutter_rust_bridge::for_generated::PlatformGeneralizedUint8ListPtr,
    rust_vec_len: i32,
    data_len: i32,
) -> flutter_rust_bridge::for_generated::WireSyncRust2DartSse {
    // Codec=Pde (Serialization + dispatch), see doc to use other codecs
    match func_id {
        1 => wire__crate__api__rustc__rustc_version_impl(ptr, rust_vec_len, data_len),
        _ => unreachable!(),
    }
}

// Section: rust2dart

// Codec=Dco (DartCObject based), see doc to use other codecs
impl flutter_rust_bridge::IntoDart for crate::yande::model::post::Post {
    fn into_dart(self) -> flutter_rust_bridge::for_generated::DartAbi {
        [
            self.id.into_into_dart().into_dart(),
            self.tags.into_into_dart().into_dart(),
            self.created_at.into_into_dart().into_dart(),
            self.updated_at.into_into_dart().into_dart(),
            self.creator_id.into_into_dart().into_dart(),
            self.author.into_into_dart().into_dart(),
            self.change.into_into_dart().into_dart(),
            self.source.into_into_dart().into_dart(),
            self.score.into_into_dart().into_dart(),
            self.md5.into_into_dart().into_dart(),
            self.file_size.into_into_dart().into_dart(),
            self.file_ext.into_into_dart().into_dart(),
            self.file_url.into_into_dart().into_dart(),
            self.is_shown_in_index.into_into_dart().into_dart(),
            self.preview_url.into_into_dart().into_dart(),
            self.preview_width.into_into_dart().into_dart(),
            self.preview_height.into_into_dart().into_dart(),
            self.actual_preview_width.into_into_dart().into_dart(),
            self.actual_preview_height.into_into_dart().into_dart(),
            self.sample_url.into_into_dart().into_dart(),
            self.sample_width.into_into_dart().into_dart(),
            self.sample_height.into_into_dart().into_dart(),
            self.sample_file_size.into_into_dart().into_dart(),
            self.jpeg_url.into_into_dart().into_dart(),
            self.jpeg_width.into_into_dart().into_dart(),
            self.jpeg_height.into_into_dart().into_dart(),
            self.jpeg_file_size.into_into_dart().into_dart(),
            self.rating.into_into_dart().into_dart(),
            self.is_rating_locked.into_into_dart().into_dart(),
            self.has_children.into_into_dart().into_dart(),
            self.parent_id.into_into_dart().into_dart(),
            self.status.into_into_dart().into_dart(),
            self.is_pending.into_into_dart().into_dart(),
            self.width.into_into_dart().into_dart(),
            self.height.into_into_dart().into_dart(),
            self.is_held.into_into_dart().into_dart(),
            self.is_note_locked.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl flutter_rust_bridge::for_generated::IntoDartExceptPrimitive
    for crate::yande::model::post::Post
{
}
impl flutter_rust_bridge::IntoIntoDart<crate::yande::model::post::Post>
    for crate::yande::model::post::Post
{
    fn into_into_dart(self) -> crate::yande::model::post::Post {
        self
    }
}
// Codec=Dco (DartCObject based), see doc to use other codecs
impl flutter_rust_bridge::IntoDart for crate::yande::model::similar::Similar {
    fn into_dart(self) -> flutter_rust_bridge::for_generated::DartAbi {
        [
            self.posts.into_into_dart().into_dart(),
            self.source.into_into_dart().into_dart(),
        ]
        .into_dart()
    }
}
impl flutter_rust_bridge::for_generated::IntoDartExceptPrimitive
    for crate::yande::model::similar::Similar
{
}
impl flutter_rust_bridge::IntoIntoDart<crate::yande::model::similar::Similar>
    for crate::yande::model::similar::Similar
{
    fn into_into_dart(self) -> crate::yande::model::similar::Similar {
        self
    }
}

impl SseEncode for flutter_rust_bridge::for_generated::anyhow::Error {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <String>::sse_encode(format!("{:?}", self), serializer);
    }
}

impl SseEncode for flutter_rust_bridge::DartOpaque {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <usize>::sse_encode(self.encode(), serializer);
    }
}

impl SseEncode for String {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <Vec<u8>>::sse_encode(self.into_bytes(), serializer);
    }
}

impl SseEncode for bool {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self as _).unwrap();
    }
}

impl SseEncode for i64 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_i64::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for Vec<String> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <String>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for Vec<crate::yande::model::post::Post> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <crate::yande::model::post::Post>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for Vec<u8> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i32>::sse_encode(self.len() as _, serializer);
        for item in self {
            <u8>::sse_encode(item, serializer);
        }
    }
}

impl SseEncode for Option<i64> {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <bool>::sse_encode(self.is_some(), serializer);
        if let Some(value) = self {
            <i64>::sse_encode(value, serializer);
        }
    }
}

impl SseEncode for crate::yande::model::post::Post {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <i64>::sse_encode(self.id, serializer);
        <String>::sse_encode(self.tags, serializer);
        <i64>::sse_encode(self.created_at, serializer);
        <i64>::sse_encode(self.updated_at, serializer);
        <i64>::sse_encode(self.creator_id, serializer);
        <String>::sse_encode(self.author, serializer);
        <i64>::sse_encode(self.change, serializer);
        <String>::sse_encode(self.source, serializer);
        <i64>::sse_encode(self.score, serializer);
        <String>::sse_encode(self.md5, serializer);
        <i64>::sse_encode(self.file_size, serializer);
        <String>::sse_encode(self.file_ext, serializer);
        <String>::sse_encode(self.file_url, serializer);
        <bool>::sse_encode(self.is_shown_in_index, serializer);
        <String>::sse_encode(self.preview_url, serializer);
        <i64>::sse_encode(self.preview_width, serializer);
        <i64>::sse_encode(self.preview_height, serializer);
        <i64>::sse_encode(self.actual_preview_width, serializer);
        <i64>::sse_encode(self.actual_preview_height, serializer);
        <String>::sse_encode(self.sample_url, serializer);
        <i64>::sse_encode(self.sample_width, serializer);
        <i64>::sse_encode(self.sample_height, serializer);
        <i64>::sse_encode(self.sample_file_size, serializer);
        <String>::sse_encode(self.jpeg_url, serializer);
        <i64>::sse_encode(self.jpeg_width, serializer);
        <i64>::sse_encode(self.jpeg_height, serializer);
        <i64>::sse_encode(self.jpeg_file_size, serializer);
        <String>::sse_encode(self.rating, serializer);
        <bool>::sse_encode(self.is_rating_locked, serializer);
        <bool>::sse_encode(self.has_children, serializer);
        <Option<i64>>::sse_encode(self.parent_id, serializer);
        <String>::sse_encode(self.status, serializer);
        <bool>::sse_encode(self.is_pending, serializer);
        <i64>::sse_encode(self.width, serializer);
        <i64>::sse_encode(self.height, serializer);
        <bool>::sse_encode(self.is_held, serializer);
        <bool>::sse_encode(self.is_note_locked, serializer);
    }
}

impl SseEncode for crate::yande::model::similar::Similar {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        <Vec<crate::yande::model::post::Post>>::sse_encode(self.posts, serializer);
        <crate::yande::model::post::Post>::sse_encode(self.source, serializer);
    }
}

impl SseEncode for u32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u32::<NativeEndian>(self).unwrap();
    }
}

impl SseEncode for u8 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_u8(self).unwrap();
    }
}

impl SseEncode for () {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {}
}

impl SseEncode for usize {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer
            .cursor
            .write_u64::<NativeEndian>(self as _)
            .unwrap();
    }
}

impl SseEncode for i32 {
    // Codec=Sse (Serialization based), see doc to use other codecs
    fn sse_encode(self, serializer: &mut flutter_rust_bridge::for_generated::SseSerializer) {
        serializer.cursor.write_i32::<NativeEndian>(self).unwrap();
    }
}

#[cfg(not(target_family = "wasm"))]
#[path = "frb_generated.io.rs"]
mod io;
#[cfg(not(target_family = "wasm"))]
pub use io::*;

/// cbindgen:ignore
#[cfg(target_family = "wasm")]
#[path = "frb_generated.web.rs"]
mod web;
#[cfg(target_family = "wasm")]
pub use web::*;
