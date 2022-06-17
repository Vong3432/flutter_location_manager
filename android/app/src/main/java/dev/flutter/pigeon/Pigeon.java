// Autogenerated from Pigeon (v3.1.5), do not edit directly.
// See also: https://pub.dev/packages/pigeon

package com.example.location_manager;

import android.util.Log;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MessageCodec;
import io.flutter.plugin.common.StandardMessageCodec;
import java.io.ByteArrayOutputStream;
import java.nio.ByteBuffer;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

/** Generated class from Pigeon. */
@SuppressWarnings({"unused", "unchecked", "CodeBlock2Expr", "RedundantSuppression"})
public class Pigeon {

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class LocationStatus {
    private @NonNull String status;
    public @NonNull String getStatus() { return status; }
    public void setStatus(@NonNull String setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"status\" is null.");
      }
      this.status = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private LocationStatus() {}
    public static final class Builder {
      private @Nullable String status;
      public @NonNull Builder setStatus(@NonNull String setterArg) {
        this.status = setterArg;
        return this;
      }
      public @NonNull LocationStatus build() {
        LocationStatus pigeonReturn = new LocationStatus();
        pigeonReturn.setStatus(status);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("status", status);
      return toMapResult;
    }
    static @NonNull LocationStatus fromMap(@NonNull Map<String, Object> map) {
      LocationStatus pigeonResult = new LocationStatus();
      Object status = map.get("status");
      pigeonResult.setStatus((String)status);
      return pigeonResult;
    }
  }

  /** Generated class from Pigeon that represents data sent in messages. */
  public static class LocationCoordinate {
    private @NonNull Double latitude;
    public @NonNull Double getLatitude() { return latitude; }
    public void setLatitude(@NonNull Double setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"latitude\" is null.");
      }
      this.latitude = setterArg;
    }

    private @NonNull Double longitude;
    public @NonNull Double getLongitude() { return longitude; }
    public void setLongitude(@NonNull Double setterArg) {
      if (setterArg == null) {
        throw new IllegalStateException("Nonnull field \"longitude\" is null.");
      }
      this.longitude = setterArg;
    }

    /** Constructor is private to enforce null safety; use Builder. */
    private LocationCoordinate() {}
    public static final class Builder {
      private @Nullable Double latitude;
      public @NonNull Builder setLatitude(@NonNull Double setterArg) {
        this.latitude = setterArg;
        return this;
      }
      private @Nullable Double longitude;
      public @NonNull Builder setLongitude(@NonNull Double setterArg) {
        this.longitude = setterArg;
        return this;
      }
      public @NonNull LocationCoordinate build() {
        LocationCoordinate pigeonReturn = new LocationCoordinate();
        pigeonReturn.setLatitude(latitude);
        pigeonReturn.setLongitude(longitude);
        return pigeonReturn;
      }
    }
    @NonNull Map<String, Object> toMap() {
      Map<String, Object> toMapResult = new HashMap<>();
      toMapResult.put("latitude", latitude);
      toMapResult.put("longitude", longitude);
      return toMapResult;
    }
    static @NonNull LocationCoordinate fromMap(@NonNull Map<String, Object> map) {
      LocationCoordinate pigeonResult = new LocationCoordinate();
      Object latitude = map.get("latitude");
      pigeonResult.setLatitude((Double)latitude);
      Object longitude = map.get("longitude");
      pigeonResult.setLongitude((Double)longitude);
      return pigeonResult;
    }
  }
  private static class LocationAPICodec extends StandardMessageCodec {
    public static final LocationAPICodec INSTANCE = new LocationAPICodec();
    private LocationAPICodec() {}
    @Override
    protected Object readValueOfType(byte type, ByteBuffer buffer) {
      switch (type) {
        case (byte)128:         
          return LocationCoordinate.fromMap((Map<String, Object>) readValue(buffer));
        
        case (byte)129:         
          return LocationStatus.fromMap((Map<String, Object>) readValue(buffer));
        
        default:        
          return super.readValueOfType(type, buffer);
        
      }
    }
    @Override
    protected void writeValue(ByteArrayOutputStream stream, Object value)     {
      if (value instanceof LocationCoordinate) {
        stream.write(128);
        writeValue(stream, ((LocationCoordinate) value).toMap());
      } else 
      if (value instanceof LocationStatus) {
        stream.write(129);
        writeValue(stream, ((LocationStatus) value).toMap());
      } else 
{
        super.writeValue(stream, value);
      }
    }
  }

  /** Generated interface from Pigeon that represents a handler of messages from Flutter.*/
  public interface LocationAPI {
    @NonNull LocationStatus getLocationStatus();
    @Nullable LocationCoordinate getLocationCoord();
    void requestLocationPermission();
    void listenLocationCoordinate();
    void stopListenLocationCoordinate();

    /** The codec used by LocationAPI. */
    static MessageCodec<Object> getCodec() {
      return LocationAPICodec.INSTANCE;
    }

    /** Sets up an instance of `LocationAPI` to handle messages through the `binaryMessenger`. */
    static void setup(BinaryMessenger binaryMessenger, LocationAPI api) {
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.LocationAPI.getLocationStatus", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              LocationStatus output = api.getLocationStatus();
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.LocationAPI.getLocationCoord", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              LocationCoordinate output = api.getLocationCoord();
              wrapped.put("result", output);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.LocationAPI.requestLocationPermission", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.requestLocationPermission();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.LocationAPI.listenLocationCoordinate", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.listenLocationCoordinate();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
      {
        BasicMessageChannel<Object> channel =
            new BasicMessageChannel<>(binaryMessenger, "dev.flutter.pigeon.LocationAPI.stopListenLocationCoordinate", getCodec());
        if (api != null) {
          channel.setMessageHandler((message, reply) -> {
            Map<String, Object> wrapped = new HashMap<>();
            try {
              api.stopListenLocationCoordinate();
              wrapped.put("result", null);
            }
            catch (Error | RuntimeException exception) {
              wrapped.put("error", wrapError(exception));
            }
            reply.reply(wrapped);
          });
        } else {
          channel.setMessageHandler(null);
        }
      }
    }
  }
  private static Map<String, Object> wrapError(Throwable exception) {
    Map<String, Object> errorMap = new HashMap<>();
    errorMap.put("message", exception.toString());
    errorMap.put("code", exception.getClass().getSimpleName());
    errorMap.put("details", "Cause: " + exception.getCause() + ", Stacktrace: " + Log.getStackTraceString(exception));
    return errorMap;
  }
}